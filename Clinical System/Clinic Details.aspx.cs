using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using static System.Net.Mime.MediaTypeNames;
public partial class _Default : System.Web.UI.Page
{
    bool flag;
    public SqlConnection SqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
    public SqlCommand cmd;
    public string q;
    public SqlDataAdapter adapter;
    public SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillForm();
        }
        checkFlag();
    }

    public void checkFlag()
    {
        q = "select clinic_name, clinic_addrs, clinic_area, clinic_city, clinic_pin, clinic_contact, clinic_website, clinic_email, cast (start_time as time(0)) as start_time, cast (end_time as time(0)) as end_time from clinic_detail where clinic_id=1";
        SqlCon.Open();
        cmd = new SqlCommand(q, SqlCon);
        reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            flag = true;
        }
        else { flag = false; }

        SqlCon.Close();
    }

    public void fillForm()
    {
        SqlCon.Open();
        q = "select clinic_name, clinic_addrs, clinic_area, clinic_city, clinic_pin, clinic_contact, clinic_website, clinic_email, cast (start_time as time(0)) as start_time, cast (end_time as time(0)) as end_time from clinic_detail where clinic_id=1";
        cmd = new SqlCommand(q, SqlCon);
        reader = cmd.ExecuteReader();

        if (reader.Read())
        {
            name.Text = reader["clinic_name"].ToString();
            address.Text = reader["clinic_addrs"].ToString();
            area.Text = reader["clinic_area"].ToString();
            city.Text = reader["clinic_city"].ToString();
            pin.Text = reader["clinic_pin"].ToString();
            contact.Text = reader["clinic_contact"].ToString();
            website.Text = reader["clinic_website"].ToString();
            email.Text = reader["clinic_email"].ToString();
            starttime.Value = reader["start_time"].ToString();
            endtime.Value = reader["end_time"].ToString();
        }
        SqlCon.Close();
    }

    protected void save_Click(object sender, EventArgs e)
    {
        string cadd = "";
        cadd = address.Text;
        string carea = "";
        carea = area.Text;
        string cpin = "";
        cpin = pin.Text;
        string cweb = "";
        cweb = website.Text;

        if (flag)
        {
            try
            {
                string qupdate = $"update clinic_detail set clinic_name = '{name.Text}', clinic_addrs ='{address.Text}', clinic_area='{area.Text}', clinic_city='{city.Text}' , clinic_pin= {pin.Text} , clinic_contact='{contact.Text}', clinic_website='{website.Text}', clinic_email = '{email.Text}', start_time = '{starttime.Value}', end_time = '{endtime.Value}', am_pm_start = 'pm', am_pm_end = 'am' where clinic_id = 1";
                SqlCon.Open();
                cmd = new SqlCommand(qupdate, SqlCon);
                reader = cmd.ExecuteReader();
                clinicDt.Show();
            }
            catch { }
            finally { SqlCon.Close(); }
        }
        else
        {
            try
            {
                string qinsert = $"insert into clinic_detail (clinic_name ,clinic_addrs ,clinic_area,clinic_city,clinic_pin,clinic_contact,clinic_website,clinic_email,start_time,end_time,clinic_id) values('{name.Text}','{cadd}','{carea}', '{city.Text}', {cpin}, '{contact.Text}', '{cweb}', '{email.Text}', '{starttime.Value}', '{endtime.Value}',1)";
                SqlCon.Open();
                cmd = new SqlCommand(qinsert, SqlCon);
                reader = cmd.ExecuteReader();
                clinicDt.Show();
            }
            catch (Exception)
            {
                //error
            }
            finally { SqlCon.Close(); }

        }

    }

    protected void clear_Click(object sender, EventArgs e)
    {
        name.Text = "";
        address.Text = "";
        area.Text = "";
        city.Text = "";
        pin.Text = "";
        contact.Text = "";
        website.Text = "";
        email.Text = "";
        starttime.Value = "0:0";
        endtime.Value = "0:0";
    }
}
