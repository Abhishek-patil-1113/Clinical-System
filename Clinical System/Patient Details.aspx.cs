using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class _Default : System.Web.UI.Page
{
    public SqlConnection SqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
    public SqlCommand cmd;
    public string q;
    public SqlDataAdapter adapter;
    public SqlDataReader reader;
    int pkUpdate;
    DataSet tb, tb1, tb2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (TabContainer1.Visible)
            {
                hdnTabContainerVisible.Value = "true";
            }
        }
        else
        {
        }
        loadTable();
    }

    public void loadTable()
    {
        q = $"select patient_id, patient_name,patient_city,patient_gender,patient_contact,reg_dt from patient";
        SqlCon.Open();
        DataSet tb = new DataSet();
        adapter = new SqlDataAdapter(q, SqlCon);
        adapter.Fill(tb, "patient");
        SqlCon.Close();
        patientlist.DataSource = tb;
        patientlist.DataBind();
    }
    protected void save_Click(object sender, EventArgs e)
    {
        string padd = "";
        padd = address.Text;
        string parea = "";
        parea = area.Text;
        string ppin = "";
        ppin = pin.Text;
        string pgender = gender.SelectedItem.Value.ToString();
        string pdob = "";
        pdob = dob.Text;
        string pref = "";
        pref = reference.Text;
        string pbg = "";
        pbg = bloodgroup.SelectedItem.Value;
        int pid;

        if (patientlist.SelectedIndex == -1)
        {
            try
            {
                string maxFind = "select max(patient_id) from patient";
                SqlCon.Open();
                cmd = new SqlCommand(maxFind, SqlCon);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    pid = (Convert.ToInt32(reader[0].ToString())) + 1;
                }
                else
                {
                    pid = 1;
                }
                ViewState["AddOnTabs"] = pid;
                SqlCon.Close();

                string qinsert = $"insert into patient" +
                                  $" values({pid}, '{name.Text}','{padd}', '{parea}', '{city.Text}', '{ppin}', '{pgender}','{pdob}', '{contact.Text}', '{email.Text}', '{pref}','{pbg}', '{dor.Text}')";
                SqlCon.Open();
                cmd = new SqlCommand(qinsert, SqlCon);
                reader = cmd.ExecuteReader();
            }
            catch (Exception ex) { Response.Write(ex.ToString()); }
            finally { SqlCon.Close(); }
        }
        else
        {
            try
            {
                pkUpdate = Convert.ToInt32(ViewState["pkUpdate1"]);
                ViewState["AddOnTabs"] = pkUpdate;
                string qupdate = $"update patient set patient_name = '{name.Text}', patient_addrs = '{padd}', patient_area ='{parea}', patient_city = '{city.Text}', patient_pin = '{ppin}', patient_gender = '{pgender}', patient_dob = '{pdob}', patient_contact = '{contact.Text}', patient_email = '{email.Text}', patient_ref = '{pref}', patient_blood_group = '{pbg}'  , reg_dt = '{dor.Text}'  where patient_id = {pkUpdate} ";
                SqlCon.Open();
                cmd = new SqlCommand(qupdate, SqlCon);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally { SqlCon.Close(); }

            string allergyTable = $"select allergy_id, allergy, allergy_start_dt from allergy_history where patient_id = {pkUpdate} ";
            SqlCon.Open();
            tb = new DataSet();
            adapter = new SqlDataAdapter(allergyTable, SqlCon);
            adapter.Fill(tb, "allergy");
            SqlCon.Close();
            allergygrid.DataSource = tb;
            allergygrid.DataBind();

            string cronicD = $"select cronic_disease_id, cronic_disease, cronic_disease_start_dt from cronic_disease where patient_id = {pkUpdate} ";
            SqlCon.Open();
            tb1 = new DataSet();
            adapter = new SqlDataAdapter(cronicD, SqlCon);
            adapter.Fill(tb1, "cronicD");
            SqlCon.Close();
            chronicdiseasegrid.DataSource = tb1;
            chronicdiseasegrid.DataBind();

            string medHistory = $"select patient_med_id, medicine, frequency from medication_history where patient_id = {pkUpdate} ";
            SqlCon.Open();
            tb2 = new DataSet();
            adapter = new SqlDataAdapter(medHistory, SqlCon);
            adapter.Fill(tb2, "MedicineH");
            SqlCon.Close();
            historygrid.DataSource = tb2;
            historygrid.DataBind();
        }

        patientlist.DataBind();
        patientmodal.Show();
        TabContainer1.Visible = true;
        //name.Text = "";
        //address.Text = "";
        //area.Text = "";
        //city.Text = "";
        //pin.Text = "";
        ////gender.ClearSelection();
        //dob.Text = "";
        //contact.Text = "";
        //email.Text = "";
        //reference.Text = "";
        //dor.Text = "";
        //bloodgroup.SelectedIndex = 0;
        //patienttab.ActiveTabIndex = 0;

    }

    protected void allergygrid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void patientlist_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        patientlist.SelectedIndex = e.NewSelectedIndex;

        GridViewRow row = patientlist.Rows[patientlist.SelectedIndex];
        Label l1 = (Label)row.FindControl("Label1");
        int pk = Convert.ToInt32(l1.Text);

        ViewState["pkUpdate1"] = pk;

        string FillDataQ = $"select patient_id,patient_name,patient_addrs,patient_area,patient_city,patient_pin,patient_gender, patient_dob, patient_contact , patient_email, patient_ref, patient_blood_group, reg_dt from patient where patient_id = {pk}";

        SqlCon.Open();
        cmd = new SqlCommand(FillDataQ, SqlCon);
        reader = cmd.ExecuteReader();
        reader.Read();

        name.Text = reader[1].ToString();
        address.Text = reader[2].ToString();
        area.Text = reader[3].ToString();
        city.Text = reader[4].ToString();
        pin.Text = reader[5].ToString();
        //gender.Text = reader[6].ToString();
        foreach (ListItem listItem in gender.Items)
        {
            if (listItem.Value == reader[6].ToString())
            {
                listItem.Selected = true;
                break;
            }
        }
        //dob.Text = reader[7].ToString();
        DateTime dt = Convert.ToDateTime(reader[7]);
        dob.Text = dt.ToString("yyyy-MM-dd");
        contact.Text = reader[8].ToString();
        email.Text = reader[9].ToString();
        reference.Text = reader[10].ToString();
        //bloodgroup.Text = reader[11].ToString();
        bloodgroup.SelectedIndex = -1;
        foreach (ListItem listItem in bloodgroup.Items)
        {
            if (listItem.Value == reader[11].ToString())
            {
                listItem.Selected = true;
                break;
            }
        }
        //dor.Text = reader[12].ToString();
        DateTime dt1 = Convert.ToDateTime(reader[12]);
        dor.Text = dt.ToString("yyyy-MM-dd");

        patienttab.ActiveTabIndex = 1;
    }

    protected void patienttab_ActiveTabChanged(object sender, EventArgs e)
    {
        //patientlist.DataBind();
        name.Text = "";
        address.Text = "";
        area.Text = "";
        city.Text = "";
        pin.Text = "";
        gender.ClearSelection();
        dob.Text = "";
        contact.Text = "";
        email.Text = "";
        reference.Text = "";
        dor.Text = "";
        bloodgroup.SelectedIndex = 0;
        patientlist.EditIndex = -1;
        patientlist.SelectedIndex = -1;

        TabContainer1.Visible = false;

        DataTable dt1 = new DataTable();
        allergygrid.DataSource = dt1;
        allergygrid.DataBind();
        chronicdiseasegrid.DataSource = dt1;
        chronicdiseasegrid.DataBind();
        historygrid.DataSource = dt1;
        historygrid.DataBind();
    }

    protected void patientlist_DataBinding(object sender, EventArgs e)
    {
    }

    protected void patientlist_DataBound(object sender, EventArgs e)
    {
    }

    protected void btnmediAdd_Click(object sender, EventArgs e)
    {
        string maxAllergy = $"select max(allergy_id) from allergy_history";
        SqlCon.Open();
        cmd = new SqlCommand(maxAllergy, SqlCon);
        reader = cmd.ExecuteReader();
        int aid;
        if (reader.Read())
        {
            aid = (Convert.ToInt32(reader[0].ToString())) + 1;
        }
        else
        {
            aid = 1;
        }
        SqlCon.Close();

        int patientID = Convert.ToInt32(ViewState["AddOnTabs"]);
        string allergy = txtAllergy.Text;
        string stdate = allergyStart.Text;

        string insertALlergyQ = $"insert into allergy_history values ({aid}, {patientID}, '{allergy}', '{stdate}')";
        SqlCon.Open();
        cmd = new SqlCommand(insertALlergyQ, SqlCon);
        reader = cmd.ExecuteReader();
        SqlCon.Close();

        txtAllergy.Text = "";
        allergyStart.Text = "";

        refreshAllergy();
    }

    protected void tbncroadd_Click(object sender, EventArgs e)
    {
        string maxCronic = $"select max(cronic_disease_id) from cronic_disease";
        SqlCon.Open();
        cmd = new SqlCommand(maxCronic, SqlCon);
        reader = cmd.ExecuteReader();
        int cid;
        if (reader.Read())
        {
            cid = (Convert.ToInt32(reader[0].ToString())) + 1;
        }
        else
        {
            cid = 1;
        }
        SqlCon.Close();

        int patientID = Convert.ToInt32(ViewState["AddOnTabs"]);
        string cronic = txtcronic.Text;
        string cstdate = txtcronicstart.Text;

        string insertCronicQ = $"insert into cronic_disease values ({cid}, {patientID}, '{cronic}', '{cstdate}')";
        SqlCon.Open();
        cmd = new SqlCommand(insertCronicQ, SqlCon);
        reader = cmd.ExecuteReader();
        SqlCon.Close();

        txtcronic.Text = "";
        txtcronicstart.Text = "";

        refreshCronic();

    }

    protected void btnmedhistoryadd_Click(object sender, EventArgs e)
    {
        string maxMed = $"select max(patient_med_id) from medication_history";
        SqlCon.Open();
        cmd = new SqlCommand(maxMed, SqlCon);
        reader = cmd.ExecuteReader();
        int mid;
        if (reader.Read())
        {
            mid = (Convert.ToInt32(reader[0].ToString())) + 1;
        }
        else
        {
            mid = 1;
        }
        SqlCon.Close();

        int patientID = Convert.ToInt32(ViewState["AddOnTabs"]);
        string med = txtmediname.Text;
        string freq = txtfreq.Text;

        string insertMedHisQ = $"insert into medication_history values ({mid}, {patientID}, '{med}', '{freq}')";
        SqlCon.Open();
        cmd = new SqlCommand(insertMedHisQ, SqlCon);
        reader = cmd.ExecuteReader();
        SqlCon.Close();

        txtmediname.Text = "";
        txtfreq.Text = "";

        refreshHistory();
    }



    protected void allergygrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = allergygrid.Rows[e.RowIndex];
        Label l1 = (Label)row.FindControl("Label_allID");
        int r = Convert.ToInt32(l1.Text);

        string deleteAllergy = $"delete from allergy_history where allergy_id= {r}";
        SqlCon.Open();
        cmd = new SqlCommand(deleteAllergy, SqlCon);
        reader = cmd.ExecuteReader();
        SqlCon.Close();

        refreshAllergy();
    }

    protected void chronicdiseasegrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = chronicdiseasegrid.Rows[e.RowIndex];
        Label l1 = (Label)row.FindControl("Label_croID");
        int r = Convert.ToInt32(l1.Text);

        string deleteCronic = $"delete from cronic_disease where cronic_disease_id= {r}";
        SqlCon.Open();
        cmd = new SqlCommand(deleteCronic, SqlCon);
        reader = cmd.ExecuteReader();
        SqlCon.Close();

        refreshCronic();
    }

    protected void historygrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = historygrid.Rows[e.RowIndex];
        Label l1 = (Label)row.FindControl("Label_medID");
        int r = Convert.ToInt32(l1.Text);

        string deleteMedHis = $"delete from medication_history where patient_med_id= {r}";
        SqlCon.Open();
        cmd = new SqlCommand(deleteMedHis, SqlCon);
        reader = cmd.ExecuteReader();
        SqlCon.Close();

        int patientID = Convert.ToInt32(ViewState["AddOnTabs"]);

        refreshHistory();
    }

    protected void allergygrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        allergygrid.EditIndex = e.NewEditIndex;

        refreshAllergy();
    }

    protected void allergygrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = allergygrid.Rows[e.RowIndex];

        Label l1 = (Label)row.FindControl("Label_allID");
        TextBox t2 = (TextBox)row.FindControl("TextBox2");
        TextBox t3 = (TextBox)row.FindControl("TextBox3");

        string updateAllergy = $"update allergy_history set allergy = '{t2.Text}' , allergy_start_dt = '{t3.Text}' where allergy_id = {l1.Text} ";

        SqlCon.Open();
        cmd = new SqlCommand(updateAllergy, SqlCon);
        reader = cmd.ExecuteReader();
        SqlCon.Close();

        allergygrid.EditIndex = -1;

        refreshAllergy();
    }

    protected void allergygrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        allergygrid.EditIndex = -1;

        refreshAllergy();
    }

    protected void chronicdiseasegrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        chronicdiseasegrid.EditIndex = -1;

        refreshCronic();
    }

    protected void historygrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        historygrid.EditIndex = -1;

        refreshHistory();
    }


    protected void historygrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        historygrid.EditIndex = e.NewEditIndex;

        refreshHistory();
    }
    protected void chronicdiseasegrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        chronicdiseasegrid.EditIndex = e.NewEditIndex;

        refreshCronic();
    }

    protected void chronicdiseasegrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = chronicdiseasegrid.Rows[e.RowIndex];

        Label l1 = (Label)row.FindControl("Label_croID");
        TextBox t2 = (TextBox)row.FindControl("TextBox5");
        TextBox t3 = (TextBox)row.FindControl("TextBox6");

        string updateCronic = $" update cronic_disease set cronic_disease = '{t2.Text}' , cronic_disease_start_dt = '{t3.Text}' where cronic_disease_id = {l1.Text}  ";

        SqlCon.Open();
        cmd = new SqlCommand(updateCronic, SqlCon);
        reader = cmd.ExecuteReader();
        SqlCon.Close();

        chronicdiseasegrid.EditIndex = -1;

        refreshCronic();
    }
    protected void historygrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = historygrid.Rows[e.RowIndex];

        Label l1 = (Label)row.FindControl("Label_medID");
        TextBox t2 = (TextBox)row.FindControl("TextBox8");
        TextBox t3 = (TextBox)row.FindControl("TextBox9");

        string updateMedi = $" update medication_history set medicine = '{t2.Text}' , frequency = '{t3.Text}' where patient_med_id = {l1.Text} ";

        SqlCon.Open();
        cmd = new SqlCommand(updateMedi, SqlCon);
        reader = cmd.ExecuteReader();
        SqlCon.Close();

        historygrid.EditIndex = -1;
        refreshHistory();
    }


    public void refreshAllergy()
    {
        int patientID = Convert.ToInt32(ViewState["AddOnTabs"]);

        string allergyTable = $"select allergy_id, allergy, allergy_start_dt from allergy_history where patient_id = {patientID} ";
        SqlCon.Open();
        tb = new DataSet();
        adapter = new SqlDataAdapter(allergyTable, SqlCon);
        adapter.Fill(tb, "allergy");
        SqlCon.Close();
        allergygrid.DataSource = tb;
        allergygrid.DataBind();
    }

    public void refreshCronic()
    {
        int patientID = Convert.ToInt32(ViewState["AddOnTabs"]);

        string cronicD = $"select cronic_disease_id, cronic_disease, cronic_disease_start_dt from cronic_disease where patient_id = {patientID} ";
        SqlCon.Open();
        tb1 = new DataSet();
        adapter = new SqlDataAdapter(cronicD, SqlCon);
        adapter.Fill(tb1, "cronicD");
        SqlCon.Close();
        chronicdiseasegrid.DataSource = tb1;
        chronicdiseasegrid.DataBind();
    }

    public void refreshHistory()
    {
        int patientID = Convert.ToInt32(ViewState["AddOnTabs"]);

        string medHistory = $"select patient_med_id, medicine, frequency from medication_history where patient_id = {patientID} ";
        SqlCon.Open();
        tb2 = new DataSet();
        adapter = new SqlDataAdapter(medHistory, SqlCon);
        adapter.Fill(tb2, "MedicineH");
        SqlCon.Close();
        historygrid.DataSource = tb2;
        historygrid.DataBind();
    }

    protected void btnmedhistoryclear_Click(object sender, EventArgs e)
    {
        txtmediname.Text = "";
        txtfreq.Text = "";
    }

    protected void btncroclear_Click(object sender, EventArgs e)
    {
        txtcronic.Text = "";
        txtcronicstart.Text = "";
    }

    protected void btnmediClear_Click(object sender, EventArgs e)
    {
        txtAllergy.Text = "";
        allergyStart.Text = "";
    }

    protected void clear_Click(object sender, EventArgs e)
    {
        dor.Text = "";
        bloodgroup.SelectedIndex = 0;
        reference.Text = "";
        email.Text = "";
        contact.Text = "";
        dob.Text = "";
        gender.SelectedIndex = 0;
        pin.Text = "";
        city.Text = "";
        area.Text = "";
        address.Text = "";
        name.Text = "";
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        GridViewRow row = allergygrid.Rows[allergygrid.EditIndex];
        TextBox t1 = (TextBox)row.FindControl("TextBox4");
        TextBox t2 = (TextBox)row.FindControl("TextBox5");

        //string dt = "";
        //dt = t2.Text;
        //string dtnew = dt.Substring(0, Math.Min(dt.Length, 10));
        //Response.Write(dt);

        Label l1 = (Label)row.FindControl("AllergyIdEdit");

        string allUpdateQ = $"update allergy_history set allergy = '{t1.Text}' , allergy_start_dt = '{t2.Text}' where allergy_id = {l1.Text}";
        SqlCon.Open();
        cmd = new SqlCommand(allUpdateQ, SqlCon);
        cmd.ExecuteNonQuery();
        SqlCon.Close();

        allergygrid.EditIndex = -1;
        refreshAllergy();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        allergygrid.EditIndex = -1;
        refreshAllergy();
    }

    protected void BTNcroCancel_Click(object sender, EventArgs e)
    {
        chronicdiseasegrid.EditIndex = -1;
        refreshCronic();
    }

    protected void MediCancel_Click(object sender, EventArgs e)
    {
        historygrid.EditIndex = -1;
        refreshHistory();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {

    }

    protected void BTNcroUpdate_Click(object sender, EventArgs e)
    {
        GridViewRow row = chronicdiseasegrid.Rows[chronicdiseasegrid.EditIndex];
        TextBox t1 = (TextBox)row.FindControl("TextBox9");
        TextBox t2 = (TextBox)row.FindControl("TextBox10");

        Label l1 = (Label)row.FindControl("Label_croIdEdit");

        string croUpdateQ = $"update cronic_disease set cronic_disease = '{t1.Text}' , cronic_disease_start_dt = '{t2.Text}' where cronic_disease_id = {l1.Text}";
        SqlCon.Open();
        cmd = new SqlCommand(croUpdateQ, SqlCon);
        cmd.ExecuteNonQuery();
        SqlCon.Close();

        chronicdiseasegrid.EditIndex = -1;
        refreshCronic();
    }

    protected void BTNhisUpdate_Click(object sender, EventArgs e)
    {
        GridViewRow row = historygrid.Rows[historygrid.EditIndex];
        TextBox t1 = (TextBox)row.FindControl("TextBox18");
        TextBox t2 = (TextBox)row.FindControl("TextBox19");

        Label l1 = (Label)row.FindControl("Label_medIdEdit");

        string hisUpdateQ = $"update medication_history set medicine = '{t1.Text}' , frequency = '{t2.Text}' where patient_med_id = {l1.Text}";
        SqlCon.Open();
        cmd = new SqlCommand(hisUpdateQ, SqlCon);
        cmd.ExecuteNonQuery();
        SqlCon.Close();

        historygrid.EditIndex = -1;
        refreshHistory();
    }

    protected void btndel_Click(object sender, EventArgs e)
    {
        int patientid = Convert.ToInt32(ViewState["patientid"]);
        try
        {
            string deleteQ = $"delete from patient where patient_id = {patientid}";
            SqlCon.Open();
            cmd = new SqlCommand(deleteQ, SqlCon);
            cmd.ExecuteNonQuery();
        }
        catch { }
        finally { SqlCon.Close(); }

        string deleteAllergy = $"delete from allergy_history where patient_id = {patientid}";
        SqlCon.Open();
        cmd = new SqlCommand(deleteAllergy, SqlCon);
        cmd.ExecuteNonQuery();
        SqlCon.Close();

        string deleteCronic = $"delete from cronic_disease where patient_id = {patientid}";
        SqlCon.Open();
        cmd = new SqlCommand(deleteCronic, SqlCon);
        cmd.ExecuteNonQuery();
        SqlCon.Close();

        string deleteHistory = $"delete from medication_history where patient_id = {patientid}";
        SqlCon.Open();
        cmd = new SqlCommand(deleteHistory, SqlCon);
        cmd.ExecuteNonQuery();
        SqlCon.Close();

        loadTable();
    }

    protected void patientlist_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = patientlist.Rows[e.RowIndex];
        Label l1 = (Label)row.FindControl("Label1");
        int patientid = Convert.ToInt32(l1.Text);
        ViewState["patientid"] = patientid;

        delpatientmodal.Show();
    }
}