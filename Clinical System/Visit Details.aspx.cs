using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class _Default : System.Web.UI.Page
{
    public SqlConnection SqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
    public SqlCommand cmd;
    public string q;
    public SqlDataAdapter adapter;
    public SqlDataReader reader;
    DataTable medicineTable;
    DataTable inveTable;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitializeMedicineTable();
            InitializeInveTable();
            loadDoc();
            loadStaff();
        }
        else
        {
            medicineTable = (DataTable)ViewState["medicineTable"];
            inveTable = (DataTable)ViewState["inveTable"];
        }

        medi.DataSource = medicineTable;
        medi.DataBind();
        invegrid.DataSource = inveTable;
        invegrid.DataBind();
    }

    public void loadStaff()
    {
        string getStaff = "select staff_id, staff_name from staff";
        SqlCon.Open();
        cmd = new SqlCommand(getStaff, SqlCon);
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            ListItem l1 = new ListItem();
            l1.Value = reader[0].ToString();
            l1.Text = reader[1].ToString();
            stname.Items.Add(l1);
        }
        SqlCon.Close();
    }
    public void loadDoc()
    {
        string getDoc = "select staff_id, staff_name from staff where staff_work_type = 'Doctor'";
        SqlCon.Open();
        cmd = new SqlCommand(getDoc, SqlCon);
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            ListItem l1 = new ListItem();
            l1.Value = reader[0].ToString();
            l1.Text = reader[1].ToString();
            dname.Items.Add(l1);
        }
        SqlCon.Close();
    }
    private void InitializeMedicineTable()
    {
        medicineTable = new DataTable();
        DataColumn dc1 = new DataColumn("Medicine Name", typeof(string));
        DataColumn dc2 = new DataColumn("Frequency", typeof(string));
        DataColumn dc3 = new DataColumn("No of Days", typeof(string));
        medicineTable.Columns.Add(dc1);
        medicineTable.Columns.Add(dc2);
        medicineTable.Columns.Add(dc3);

        ViewState["medicineTable"] = medicineTable;
    }

    private void InitializeInveTable()
    {
        inveTable = new DataTable();
        DataColumn dc4 = new DataColumn("Investigation", typeof(string));
        DataColumn dc5 = new DataColumn("Result", typeof(string));
        inveTable.Columns.Add(dc4);
        inveTable.Columns.Add(dc5);

        ViewState["inveTable"] = inveTable;
    }

    protected void pname_TextChanged(object sender, EventArgs e)
    {
        if (pname.Text == "")
        {
            rnodrop.Items.Clear();
            rno.Visible = true;
            rnodrop.Visible = false;
        }
        else
        {
            rno.Visible = false;
            rnodrop.Visible = true;

            rnodrop.Items.Clear();
            rnodrop.Items.Add("Select");
            string searchName = $"select patient_id from patient where patient_name like '{pname.Text}%'";
            SqlCon.Open();
            cmd = new SqlCommand(searchName, SqlCon);
            reader = cmd.ExecuteReader();

            List<string> reg = new List<string>();
            while (reader.Read())
            {
                reg.Add(reader[0].ToString());
            }

            for (int i = 0; i < reg.Count; i++)
            {
                rnodrop.Items.Add(reg[i].ToString());
            }

            if (reg.Count == 0)
            {
                rno.Visible = true;
                rnodrop.Visible = false;
                rno.Text = "";
                errorStrip.Text = "No records found";
            }
            else
            {
                errorStrip.Text = "";
            }
            bloodgroup.Text = "";
            age.Text = "";
        }
    }

    protected void pname_DataBinding(object sender, EventArgs e)
    {
    }

    protected void rnodrop_SelectedIndexChanged(object sender, EventArgs e)
    {
        int pid = Convert.ToInt32(rnodrop.SelectedItem.Value);
        ViewState["pid"] = Convert.ToInt32(pid);
        string getData = $"select patient_name,patient_blood_group, year(GETDATE())-year(patient_dob)- case when DATEPART(DAYOFYEAR, GETDATE()) < DATEPART(dayofyear, patient_dob) then 1 else 0 end as Age from patient where patient_id = {pid}";
        SqlCon.Open();
        cmd = new SqlCommand(getData, SqlCon);
        reader = cmd.ExecuteReader();
        reader.Read();
        pname.Text = reader[0].ToString();
        bloodgroup.Text = reader[1].ToString();
        age.Text = reader[2].ToString();
        SqlCon.Close();
    }

    protected void rnodrop_DataBound(object sender, EventArgs e)
    {
    }

    protected void rno_TextChanged(object sender, EventArgs e)
    {
        try
        {
            int pid = Convert.ToInt32(rno.Text);
            ViewState["pid"] = Convert.ToInt32(pid);
            string getData = $"select patient_name,patient_blood_group, year(GETDATE())-year(patient_dob)- case when DATEPART(DAYOFYEAR, GETDATE()) < DATEPART(dayofyear, patient_dob) then 1 else 0 end as Age from patient where patient_id = {pid}";
            SqlCon.Open();
            cmd = new SqlCommand(getData, SqlCon);
            reader = cmd.ExecuteReader();
            reader.Read();
            pname.Text = reader[0].ToString();
            bloodgroup.Text = reader[1].ToString();
            age.Text = reader[2].ToString();
            SqlCon.Close();

            errorStrip.Text = "";
        }
        catch (Exception)
        {
            errorStrip.Text = "Invalid register number.";
            pname.Text = "";
            age.Text = "";
            bloodgroup.Text = "";
        }
    }

    protected void save_Click(object sender, EventArgs e)
    {
        string visitType = "";
        visitType = vtype.SelectedItem.Text;
        string visitTime = "";
        visitTime = vtime.Value.ToString();
        string visitDate = "";
        visitDate = vdatetxt.Text;
        int doctorID = Convert.ToInt32(dname.SelectedItem.Value.ToString());
        int staffID = Convert.ToInt32(stname.SelectedItem.Value.ToString());
        int patientID = Convert.ToInt32(ViewState["pid"]);
        string VSymptoms = "";
        VSymptoms = symptoms.Value.ToString();
        string VDiagnosis = "";
        VDiagnosis = diagnosis.Value.ToString();
        string VTemp = "";
        VTemp = tmp.Text;
        string Vbp = "";
        Vbp = bp1.Text + "/" + bp2.Text;
        string VOxy = "";
        VOxy = oxy.Text;
        string VWt = "";
        VWt = wt.Text;
        string VHeight = "";
        VHeight = ht.Text;

        string maxFind = "select max(visit_no) from visit";
        SqlCon.Open();
        cmd = new SqlCommand(maxFind, SqlCon);
        reader = cmd.ExecuteReader();
        reader.Read();
        int VisitID = (Convert.ToInt32(reader[0].ToString())) + 1;
        SqlCon.Close();

        string qinsert = $"insert into visit values ({VisitID}, '{visitType}', '{visitTime}', '{visitDate}', {doctorID} , {staffID} , {patientID} , '{VSymptoms}', '{VDiagnosis}', '{VTemp}' , '{Vbp}', '{VOxy}' , '{VWt}' , '{VHeight}', 'am' )";
        SqlCon.Open();
        cmd = new SqlCommand(qinsert, SqlCon);
        reader = cmd.ExecuteReader();
        SqlCon.Close();

        rno.Text = "";
        pname.Text = "";
        age.Text = "";
        bloodgroup.Text = "";
        vdatetxt.Text = "";
        vtime.Value = "";
        vtype.SelectedIndex = 0;
        tmp.Text = "";
        bp1.Text = bp2.Text = "";
        oxy.Text = wt.Text = ht.Text = "";
        symptoms.Value = "";
        diagnosis.Value = "";
        dname.SelectedIndex = 0;
        stname.SelectedIndex = 0;

        rnodrop.Visible = false;
        rno.Visible = true;
        rno.Text = "";

        //inserting tables

        //table1
        for (int i = 0; i < medicineTable.Rows.Count; i++)
        {
            string visitMedIDQ = "select max(visit_med_id) from medication";
            SqlCon.Open();
            cmd = new SqlCommand(visitMedIDQ, SqlCon);
            reader = cmd.ExecuteReader();
            reader.Read();
            int VisitMedID = (Convert.ToInt32(reader[0].ToString())) + 1;
            SqlCon.Close();

            String medName = medicineTable.Rows[i][0].ToString();
            String medFreq = medicineTable.Rows[i][1].ToString();
            String medNoDays = medicineTable.Rows[i][2].ToString();

            string medInsertQ = $"insert into medication values ({VisitMedID}, {VisitID}, '{medName}', '{medFreq}', {medNoDays})";
            SqlCon.Open();
            cmd = new SqlCommand(medInsertQ, SqlCon);
            reader = cmd.ExecuteReader();
            SqlCon.Close();

            medicineTable.Clear();
            medi.DataBind();
        }

        //Table2
        for (int i = 0; i < inveTable.Rows.Count; i++)
        {
            string visitInveIDQ = "select max(visit_invst_id) from investigation";
            SqlCon.Open();
            cmd = new SqlCommand(visitInveIDQ, SqlCon);
            reader = cmd.ExecuteReader();
            reader.Read();
            int VisitInveID = (Convert.ToInt32(reader[0].ToString())) + 1;
            SqlCon.Close();

            String inve = inveTable.Rows[i][0].ToString();
            String res = inveTable.Rows[i][1].ToString();

            string InveInsertQ = $"insert into investigation values ({VisitInveID}, {VisitID}, '{inve}', '{res}')";
            SqlCon.Open();
            cmd = new SqlCommand(InveInsertQ, SqlCon);
            reader = cmd.ExecuteReader();
            SqlCon.Close();


            inveTable.Clear();
            invegrid.DataBind();

        }
    }

    protected void addMedi_Click(object sender, EventArgs e)
    {
        string mediName = medicines.Text;
        string medFreq = freq.SelectedItem.Value;
        string mediDays = nday.Text;

        if (medi.SelectedIndex == -1)
        {
            DataRow dr1 = medicineTable.NewRow();
            dr1[0] = mediName;
            dr1[1] = medFreq;
            dr1[2] = mediDays;

            medicineTable.Rows.Add(dr1);
        }
        else
        {
            DataRow dr1 = medicineTable.Rows[medi.SelectedIndex];

            dr1[0] = mediName;
            dr1[1] = medFreq;
            dr1[2] = mediDays;
        }

        ViewState["MedicineTable"] = medicineTable;

        medi.SelectedIndex = -1;
        medi.EditIndex = -1;
        medi.DataSource = medicineTable;
        medi.DataBind();

        medicines.Text = "";
        freq.SelectedIndex = 0;
        nday.Text = "";

        ScriptManager.RegisterStartupScript(this, GetType(), "ScrollToMedicineSection", "scrollToMedicineSection();", true);
    }

    protected void addInvestigation_Click(object sender, EventArgs e)
    {
        string inve = investigation.Value;
        string res = result.Value;

        if (invegrid.SelectedIndex == -1)
        {

            DataRow dr1 = inveTable.NewRow();
            dr1[0] = inve;
            dr1[1] = res;

            inveTable.Rows.Add(dr1);
        }
        else
        {
            DataRow dr1 = inveTable.Rows[invegrid.SelectedIndex];
            dr1[0] = inve;
            dr1[1] = res;
        }

        ViewState["InveTable"] = inveTable;

        invegrid.SelectedIndex = -1;
        invegrid.EditIndex = -1;
        invegrid.DataSource = inveTable;
        invegrid.DataBind();

        investigation.Value = "";
        result.Value = "";

        ScriptManager.RegisterStartupScript(this, GetType(), "ScrollToInvestigationSection", "scrollToInvestigationSection();", true);
    }
    protected void clear_Click(object sender, EventArgs e)
    {
        rno.Text = "";
        rnodrop.Text = "";
        pname.Text = "";
        age.Text = "";
        bloodgroup.Text = "";
        vdatetxt.Text = "";
        vtime.Value = "0:0";
        vtype.SelectedIndex = 0;
        dname.SelectedIndex = 0;
        stname.SelectedIndex = 0;
        tmp.Text = "";
        bp1.Text = "";
        bp2.Text = "";
        oxy.Text = "";
        ht.Text = "";
        wt.Text = "";
        symptoms.Value = "";
        diagnosis.Value = "";
        medicines.Text = "";
        freq.SelectedIndex = 0;
        nday.Text = "";
        investigation.Value = "";
        result.Value = "";

        medicineTable.Clear();
        inveTable.Clear();
        medi.DataBind();
        invegrid.DataBind();
    }

    protected void medi_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
    }

    protected void medi_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        medicineTable.Rows.RemoveAt(e.RowIndex);
        medi.DataBind();
    }

    protected void medi_RowEditing(object sender, GridViewEditEventArgs e)
    {
    }

    protected void medi_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
    }

    protected void medi_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DataRow dr = medicineTable.Rows[e.NewSelectedIndex];

        medicines.Text = dr[0].ToString();
        freq.SelectedIndex = -1;
        freq.Items.FindByValue(dr[1].ToString()).Selected = true;
        nday.Text = dr[2].ToString();
    }

    protected void clearMedi_Click(object sender, EventArgs e)
    {
        medicines.Text = "";
        nday.Text = "";
        freq.SelectedIndex = 0;
        medi.SelectedIndex = -1;
    }
    protected void invegrid_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DataRow dr = inveTable.Rows[e.NewSelectedIndex];

        investigation.Value = dr[0].ToString();
        result.Value = dr[1].ToString();
    }

    protected void invegrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        inveTable.Rows.RemoveAt(e.RowIndex);
        invegrid.DataBind();
    }

    protected void clearInvestigation_Click(object sender, EventArgs e)
    {
        investigation.Value = "";
        result.Value = "";
        invegrid.SelectedIndex = -1;
    }
}