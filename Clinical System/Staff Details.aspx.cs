using AjaxControlToolkit;
using System;
using System.Activities.Expressions;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class _Default : System.Web.UI.Page
{
    public SqlConnection SqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
    public SqlCommand cmd;
    public string q;
    public SqlDataAdapter adapter;
    public SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        loadTable();
    }

    public void loadTable()
    {
        q = $"select staff_id, staff_name, staff_city, staff_gender, staff_contact from staff";
        SqlCon.Open();
        DataSet tb = new DataSet();
        adapter = new SqlDataAdapter(q, SqlCon);
        adapter.Fill(tb, "staff");
        SqlCon.Close();
        GridView1.DataSource = tb;
        GridView1.DataBind();
    }
    protected void save_Click(object sender, EventArgs e)
    {
        string sdob = "";
        sdob = dob.Text;
        string sdoj = "";
        sdoj = doj.Text;
        string squal = "";
        squal = Qualification.SelectedItem.Value;
        string sexp = "";
        sexp = experience.Text;
        string swtype = "";
        swtype = worktype.SelectedItem.Value;
        string sadd = "";
        sadd = address.Value;
        string sarea = "";
        sarea = area.Text;
        string spin = "";
        spin = pin.Text;
        string sgender = gender.SelectedItem.Value.ToString();
        int sid;

        if (GridView1.SelectedIndex == -1)
        {
            try
            {
                string maxFind = "select max(staff_id) from staff";
                SqlCon.Open();
                cmd = new SqlCommand(maxFind, SqlCon);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {

                    sid = (Convert.ToInt32(reader[0].ToString())) + 1;
                }
                else
                {
                    sid = 1;
                }
                SqlCon.Close();

                string qinsert = $"insert into staff" +
                                  $" values({sid}, '{sname.Text}','{sadd}', '{sarea}', '{city.Text}', '{spin}', '{contact.Text}', '{sgender}','{aadhar.Text}','{email.Text}','{sdob}','{sdoj}', '{squal}', '{sexp}', '{swtype}', '{password.Text}')";
                SqlCon.Open();
                cmd = new SqlCommand(qinsert, SqlCon);
                reader = cmd.ExecuteReader();
                staffmodal.Show();
            }
            catch (Exception ex) { Response.Write(ex.ToString()); }
            finally { SqlCon.Close(); }
        }
        else
        {
            try
            {
                int pkUpdate = Convert.ToInt32(ViewState["pkUpdate"]);
                string qupdate = $"update staff set staff_name = '{sname.Text}', staff_addrs = '{sadd}', staff_area ='{sarea}', staff_city = '{city.Text}', staff_pin = '{spin}', staff_contact = {contact.Text}, staff_gender = '{sgender}', staff_aadhar = {aadhar.Text}, staff_email = '{email.Text}', staff_dob = '{sdob}', staff_doj = '{sdoj}', staff_qualification = '{squal}', staff_experience = '{sexp}', staff_work_type = '{swtype}', password = '{password.Text}' where staff_id = {pkUpdate} ";
                SqlCon.Open();
                cmd = new SqlCommand(qupdate, SqlCon);
                cmd.ExecuteNonQuery();
                GridView1.SelectedIndex = -1;
                staffmodal.Show();
            }
            catch (Exception ex) {Response.Write(ex.ToString());
            }
            finally { SqlCon.Close(); }
        }

        sname.Text = "";
        address.Value = "";
        area.Text = "";
        city.Text = "";
        pin.Text = "";
        contact.Text = "";
        gender.ClearSelection();
        aadhar.Text = "";
        email.Text = "";
        dob.Text = "";
        doj.Text = "";
        Qualification.SelectedIndex = 0;
        experience.Text = "";
        worktype.SelectedIndex = 0;
        password.Text = "";

        loadTable();

        stafftab.ActiveTabIndex = 0;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void stafftab_ActiveTabChanged(object sender, EventArgs e)
    {
        loadTable();
        GridView1.SelectedIndex = -1;
        sname.Text = "";
        address.Value = "";
        area.Text = "";
        city.Text = "";
        pin.Text = "";
        contact.Text = "";
        gender.ClearSelection();
        aadhar.Text = "";
        email.Text = "";
        dob.Text = "";
        doj.Text = "";
        Qualification.SelectedIndex = 0;
        experience.Text = "";
        worktype.SelectedIndex = 0;
        password.Text = "";
    }

    protected void gender_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Qualification_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    public void deleteRow()
    {
        int staffid = Convert.ToInt32(ViewState["staffid"]);
        try
        {
            string deleteQ = $"delete from staff where staff_id = {staffid}";
            SqlCon.Open();
            cmd = new SqlCommand(deleteQ, SqlCon);
            cmd.ExecuteNonQuery();
        }
        catch { }
        finally { SqlCon.Close(); }

        loadTable();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        Label l1 = (Label)row.FindControl("Label1");
        int staffid = Convert.ToInt32(l1.Text);
        ViewState["staffid"] = staffid;

        delstaffmodal.Show();
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GridView1.SelectedIndex = e.NewSelectedIndex;

        GridViewRow row = GridView1.Rows[GridView1.SelectedIndex];
        Label l1 = (Label)row.FindControl("label1");
        int pk = Convert.ToInt32(l1.Text);

        ViewState["pkUpdate"] = pk;

        string maxFind = $"select staff_id, staff_name, staff_addrs, staff_area, staff_city, staff_pin, staff_contact, staff_gender, staff_aadhar, staff_email, staff_dob, staff_doj, staff_qualification, staff_experience, staff_work_type, password from staff where staff_id = {pk}";
        SqlCon.Open();
        cmd = new SqlCommand(maxFind, SqlCon);
        reader = cmd.ExecuteReader();
        reader.Read();

        sname.Text = reader[1].ToString();
        address.Value = reader[2].ToString();
        area.Text = reader[3].ToString();
        city.Text = reader[4].ToString();
        pin.Text = reader[5].ToString();
        contact.Text = reader[6].ToString();

        foreach (ListItem listItem in gender.Items)
        {
            if (listItem.Value == reader[7].ToString())
            {
                listItem.Selected = true;
                break;
            }
        }

        aadhar.Text = reader[8].ToString();
        email.Text = reader[9].ToString();

        DateTime dt = Convert.ToDateTime(reader[10]);
        dob.Text = dt.ToString("yyyy-MM-dd");

        DateTime dt1 = Convert.ToDateTime(reader[11]);
        doj.Text = dt1.ToString("yyyy-MM-dd");
        Qualification.SelectedIndex = -1;
        foreach (ListItem listItem in Qualification.Items)
        {
            if (listItem.Value == reader[12].ToString())
            {
                listItem.Selected = true;
                break;
            }
        }
        experience.Text = reader[13].ToString();

        worktype.SelectedIndex = -1;
        foreach (ListItem listItem in worktype.Items)
        {
            if (listItem.Value == reader[14].ToString())
            {
                listItem.Selected = true;
                break;
            }
        }
        password.Text = reader[15].ToString();
        stafftab.ActiveTabIndex = 1;
    }

    protected void btndel_Click(object sender, EventArgs e)
    {
        deleteRow();   
    }

    protected void clear_Click(object sender, EventArgs e)
    {
        sname.Text = "";
        address.Value = "";
        area.Text = "";
        city.Text = "";
        pin.Text = "";
        contact.Text = "";
        gender.ClearSelection();
        aadhar.Text = "";
        email.Text = "";
        dob.Text = "";
        doj.Text = "";
        Qualification.SelectedIndex = 0;
        experience.Text = "";
        worktype.SelectedIndex = 0;
        password.Text = "";
    }
}