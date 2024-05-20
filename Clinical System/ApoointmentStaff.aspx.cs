using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApoointmentStaff : System.Web.UI.Page
{
    public SqlConnection SqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
    public SqlCommand cmd;
    public string q;
    public SqlDataAdapter adapter;
    public SqlDataReader reader;
    int StartTime, ClosingTime;
    int pid, aid;
    protected void Page_Load(object sender, EventArgs e)
    {
        getTimeClinic();
        createTable();
        refreshTable();
        if (!IsPostBack)
        {
            loadDoc();
        }
    }

    public void getTimeClinic()
    {
        try
        {
            string clinicTimeQ = "select cast (start_time as time(0)) as start_time, cast (end_time as time(0)) as end_time from clinic_detail where clinic_id=1";
            SqlCon.Open();
            cmd = new SqlCommand(clinicTimeQ, SqlCon);
            reader = cmd.ExecuteReader();
            reader.Read();

            DateTime StartTimeDt = Convert.ToDateTime(reader[0].ToString());
            DateTime ClosingTimeDt = Convert.ToDateTime(reader[1].ToString());

            StartTime = StartTimeDt.Hour;
            ClosingTime = ClosingTimeDt.Hour;
        }
        catch { }
        finally { SqlCon.Close(); }
    }

    public void createTable()
    {
        DateTime dt = DateTime.Now;
        dt = dt.AddDays(2);
        AppointmentTable.ID = "AppointmentTable";
        AppointmentTable.BorderStyle = BorderStyle.Solid;
        AppointmentTable.BorderWidth = Unit.Pixel(5);
        AppointmentTable.CellSpacing = 3;
        AppointmentTable.CellPadding = 5;
        AppointmentTable.GridLines = GridLines.Both;

        TableHeaderRow HeaderRow = new TableHeaderRow();
        for (int i = 0; i < 8; i++)
        {
            TableHeaderCell HeaderCell = new TableHeaderCell { CssClass = "headerCell  tbl-header" };

            if (i == 0)
            {
                HeaderCell.Text = "Time";
            }
            else if (i == 1)
            {
                HeaderCell.Text = "Today";
            }
            else if (i == 2)
            {
                HeaderCell.Text = "Tomorrow";
            }
            else
            {
                HeaderCell.Text = dt.Date.ToString("dd-MM-yyyy");
                dt = dt.AddDays(1);
            }
            HeaderRow.Cells.Add(HeaderCell);
        }
        AppointmentTable.Rows.Add(HeaderRow);

        for (int i = StartTime; i < ClosingTime; i++)
        {
            TableRow tableRow = new TableRow();
            TableCell cell = new TableCell { CssClass = "tbl-cell" };
            cell.Text = $"{i}:00";
            cell.RowSpan = 5;
            tableRow.BorderWidth = 2;
            tableRow.Cells.Add(cell);

            AppointmentTable.Rows.Add(tableRow);

            for (int j = 0; j < 4; j++)
            {
                int minute = j * 15;

                string timeSlotO = $"{i:D2}:{minute:D2}";
                TableRow row = new TableRow();
                for (int k = 0; k < 7; k++)
                {
                    DateTime dateTime = DateTime.Now;
                    dateTime = dateTime.AddDays(k);
                    string timeSlot = timeSlotO + "_" + dateTime.Date.ToString("MM-dd-yyyy");

                    if (k == 0 && i <= dateTime.Hour)
                    {
                        TableCell todayCell = CreateButtonCell(timeSlot, "Unvailable", i, minute, k);
                        todayCell.CssClass = "cellBorder";
                        row.Cells.Add(todayCell);
                    }
                    else
                    {
                        TableCell todayCell = CreateButtonCell(timeSlot, "Available", i, minute, k);
                        todayCell.CssClass = "cellBorder";
                        row.Cells.Add(todayCell);
                    }
                }
                AppointmentTable.Rows.Add(row);
            }

        }

    }

    public void refreshTable()
    {
        string timeSlotCheck, DateCheck;
        ArrayList AppointmetsBooked = new ArrayList();
        ArrayList PatientList = new ArrayList();
        int index = 0, btnpid = 0;

        string maxFind = "SELECT cast(time_slot as time(0)) as time_slot, RTRIM(REPLACE(appt_date, ' 00:00:00', '')) AS appt_date, patient_id FROM appt";
        SqlCon.Open();
        cmd = new SqlCommand(maxFind, SqlCon);
        reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            AppointmetsBooked.Add(reader[0].ToString() + reader[1].ToString());
            PatientList.Add(reader[2].ToString());
        }
        SqlCon.Close();

        for (int i = StartTime; i < ClosingTime; i++)
        {
            for (int j = 0; j < 4; j++)
            {
                for (int k = 0; k < 7; k++)
                {
                    DateTime date = DateTime.Now;
                    if (j == 0)
                    {
                        timeSlotCheck = i + ":" + "00" + ":00";
                    }
                    else
                    {
                        timeSlotCheck = i + ":" + j * 15 + ":00";
                    }
                    date = date.AddDays(k);
                    DateCheck = date.Date.ToString("yyyy-MM-dd");

                    bool flag = false;
                    index = 0;
                    foreach (var ToChecked in AppointmetsBooked)
                    {
                        //Response.Write(ToChecked.ToString());
                        //Response.Write("</br>");
                        if (ToChecked.ToString() == timeSlotCheck + DateCheck)
                        {
                            btnpid = Convert.ToInt32(PatientList[index]);
                            flag = true;
                            break;
                        }
                        index++;
                    }
                    if (flag)
                    {
                        CellChange(i, j, k, btnpid);
                    }

                    //Response.Write(timeSlotCheck + DateCheck);
                    //Response.Write("</br>");
                }
            }
        }
    }
    public void CellChange(int hour, int min, int col, int btnpid)
    {
        try
        {
            string PatientFind = $"select patient_name from patient where patient_id = {btnpid}";
            SqlCon.Open();
            cmd = new SqlCommand(PatientFind, SqlCon);
            reader = cmd.ExecuteReader();
            reader.Read();
            string newText = reader[0].ToString();

            string buttonID = $"ctl00$ContentPlaceHolder1$btn_{hour}{min * 15}{col}";

            Button button = FindControl(buttonID) as Button;
            if (button != null)
            {
                button.Text = newText;
                button.Enabled = false;
            }
        }
        catch { }
        finally { SqlCon.Close(); }

    }
    private TableCell CreateButtonCell(string timeSlot, string initialText, int hour, int minute, int col)
    {
        TableCell cell = new TableCell();

        Button button = new Button
        {
            ID = $"btn_{hour}{minute}{col}",
            Text = initialText,
            CommandArgument = timeSlot,
            CssClass = "btn btn-sm btn-light w100",
        };

        button.Click += Button_Click;

        if (initialText == "Unvailable")
        {
            button.Enabled = false;
        }

        cell.Controls.Add(button);

        return cell;
    }

    private void Button_Click(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        string timeSlot = button.CommandArgument;
        Session["timeSlot"] = timeSlot;
        Session["btnID"] = button.ID;

        //Response.Write(Session["timeSlot"].ToString());
        //Response.Write(Session["btnID"].ToString());

        lblError.Visible = false;
        ModalBookAppointment.Show();

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
            DropDownDrName.Items.Add(l1);
        }
        SqlCon.Close();
    }
    protected void BtnBookModal_Click(object sender, EventArgs e)
    {
        string doc = DropDownDrName.SelectedItem.Value.ToString();


        if (RbtnListRegistrationCheck.SelectedIndex == 0)
        {
            string regno = TxtRegNo.Text;

            string maxFind = $"select patient_id from patient";
            SqlCon.Open();
            cmd = new SqlCommand(maxFind, SqlCon);
            reader = cmd.ExecuteReader();
            bool flag = false;
            while (reader.Read())
            {
                if (reader[0].ToString() == regno)
                {
                    flag = true;
                }
            }
            SqlCon.Close();

            if (flag)
            {
                //insert the appointment into appointment table 
                string timeSlot = Session["timeSlot"].ToString();
                string[] timeArr = timeSlot.Split('_');

                //try
                {
                    string maxAppt = "select max(appt_no) from appt";
                    SqlCon.Open();
                    cmd = new SqlCommand(maxAppt, SqlCon);
                    reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        aid = (Convert.ToInt32(reader[0].ToString())) + 1;
                    }
                    else
                    {
                        aid = 1;
                    }
                    SqlCon.Close();
                    string qinsert = $"insert into appt values ({aid}, 0 , 'Regular', '{timeArr[0]}', '{timeArr[1]}',{regno},{doc})";
                    SqlCon.Open();
                    cmd = new SqlCommand(qinsert, SqlCon);
                    reader = cmd.ExecuteReader();
                }
                //catch (Exception ex) { Response.Write(ex.ToString()); }
                //finally { SqlCon.Close(); }
                SqlCon.Close();

                //change the button

                string id = "ctl00$ContentPlaceHolder1$" + Session["btnID"].ToString();
                Button button = FindControl(id) as Button;
                if (button != null)
                {
                    string newText = "Booked";
                    button.Text = newText;
                    button.Enabled = false;
                }

                ModalBookAppointment.Hide();

                //dont forget to refresh the table once.
                Response.Redirect("ApoointmentStaff.aspx");
            }
            else
            {
                lblError.Visible = true;
            }
        }
        else
        {
            //insert into patient table
            //int pid;
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
                SqlCon.Close();
                string qinsert = $"insert into patient (patient_id, patient_name) values ({pid},'{TxtRegNoNew.Text}')";
                SqlCon.Open();
                cmd = new SqlCommand(qinsert, SqlCon);
                reader = cmd.ExecuteReader();
            }
            catch (Exception ex) { Response.Write(ex.ToString()); }
            finally { SqlCon.Close(); }

            //insert the appointment into appointment table 
            string timeSlot = Session["timeSlot"].ToString();
            string[] timeArr = timeSlot.Split('_');

            try
            {
                string maxFind = "select max(appt_no) from appt";
                SqlCon.Open();
                cmd = new SqlCommand(maxFind, SqlCon);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    aid = (Convert.ToInt32(reader[0].ToString())) + 1;
                }
                else
                {
                    aid = 1;
                }
                SqlCon.Close();
                string qinsert = $"insert into appt values ({aid}, 0 , 'Regular', '{timeArr[0]}', '{timeArr[1]}',{pid},{doc})";
                SqlCon.Open();
                cmd = new SqlCommand(qinsert, SqlCon);
                reader = cmd.ExecuteReader();
            }
            catch (Exception ex) { Response.Write(ex.ToString()); }
            finally { SqlCon.Close(); }
            SqlCon.Close();

            //change the button
            string id = "ctl00$ContentPlaceHolder1$" + Session["btnID"].ToString();
            Button button = FindControl(id) as Button;
            if (button != null)
            {
                string newText = "Booked";
                button.Text = newText;
                button.Enabled = false;
            }

            ModalBookAppointment.Hide();

            //dont forget to refresh the table once.
            Response.Redirect("ApoointmentStaff.aspx");

        }

    }

    protected void RbtnListRegistrationCheck_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RbtnListRegistrationCheck.SelectedIndex == 0)
        {
            NewPatient.Visible = true;
            RegisteredPatient.Visible = false;
            TxtRegNo.Text = string.Empty;
        }
        else
        {
            NewPatient.Visible = false;
            RegisteredPatient.Visible = true;
            TxtRegNoNew.Text = string.Empty;
        }
    }
}