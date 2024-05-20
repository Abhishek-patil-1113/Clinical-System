<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appoitmentHome.aspx.cs" Inherits="appoitmentHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="CustomStyles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous" />

    <style>
        .control-label {
            color: forestgreen;
            padding-top: 5px;
            margin-left: auto;
            margin-right: 0;
        }

        .form-group {
            padding-top: 10px;
            padding-bottom: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .rbl input[type="radio"] {
            margin-left: 15px;
            margin-right: 5px;
        }

        .astr {
            color: red;
        }

        body {
            background-color: #ddfff3;
        }

        .modalpanel {
            border-color: #5078B3;
            border: 1px dashed #2F4F4F;
            border-style: solid solid;
            border-width: 3px;
            /*padding: 10px;*/
            width: 25%;
            font-size: 15px;
            text-align: center;
            background-color: #c1e2f5;
            min-width: 400px;
        }

        .modelBackground {
            background-color: black;
            opacity: 0.5;
        }

        .new-label {
            font-weight: bold;
        }

        .modal-footer {
            padding: 10px;
        }

        .modal-header {
            padding-bottom: 10px;
        }

        .table-hover tbody tr td:hover {
            background-color: aquamarine;
        }

        .table-hover tbody tr:hover {
            background-color: inherit !important;
        }

        .w100 {
            width: 100%;
        }

        #AppointmentTable tbody tr td:first-child {
            /*background-color: lightblue;*/
            text-align: center;
            font-weight: bolder;
            vertical-align: middle;
        }

        .table {
            margin-top: 15px;
            border: solid;
            border-color: #005339;
            border-width: 2px;
            border-radius: 0px;
        }

        .jumbotron {
            /*font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;*/
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            /*font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;*/
            color: #17a2b8;
        }

        .tbl-header {
            background-color: #005339;
            font-size: large;
            color: #ddfff3;
            text-align: center;
        }

        .tbl-cell {
            color: #005339;
            font-size: medium;
            border: solid;
            border-width: 2px;
            text-align: center;
            font-weight: bolder;
            vertical-align: middle;
        }

        .btn-light {
            /*color:blueviolet;*/
            background-color: skyblue;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="container">
            <div class="jumbotron d-flex flex-column justify-content-between">
                <div>
                    <h1>Life Care Clinic</h1>
                    <p>
                        <asp:Label ID="lblClinicTime" runat="server" Text="Time : "></asp:Label>
                        <asp:Label ID="lblStartTime" runat="server" Text=""></asp:Label>
                        -
                <asp:Label ID="lblCloseTime" runat="server" Text=""></asp:Label>
                        <br />
                    </p>
                    <h5>Take the appointment as per your convenience.</h5>
                </div>
                <div>
                    <a runat="server" id="logoutbtn" href="../Log in.aspx" class="btn btn-info float-right">Staff Login <span class="glyphicon glyphicon-log-in"></span></a>
                </div>
            </div>
        </div>

        <div class="container table-responsive">
            <div id="TablePlace" runat="server" class="col-xs-12 col-lg-12" style="padding: 0;">
                <asp:Table ID="AppointmentTable" runat="server" CssClass="table table-active table-bordered table-hover">
                </asp:Table>
            </div>
        </div>

        <asp:LinkButton ID="btnDummy" runat="server"></asp:LinkButton>
        <ajaxToolkit:ModalPopupExtender ID="ModalBookAppointment" runat="server" TargetControlID="btnDummy" PopupControlID="PanelBookAppointment" BackgroundCssClass="modelBackground" CancelControlID="BtnCancelModal">
            <Animations>
             <OnShown>
                <Fadein Duration ="0.2" />
            </OnShown>
            <OnHiding>
                <Fadeout Duration ="0.2" />
            </OnHiding>
            </Animations>
        </ajaxToolkit:ModalPopupExtender>

        <asp:Panel ID="PanelBookAppointment" CssClass="modalpanel" runat="server">
            <asp:Panel ID="PanelHeaderAppointment" CssClass="modal-header" runat="server">
                <h2 style="color: green">Book Appointment</h2>
            </asp:Panel>
            <asp:Panel ID="modalbodyapp" runat="server" CssClass="modal-body">
                <asp:UpdatePanel ID="PanelBodyAppointment" HorizontalAlign="Left" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <asp:Label ID="PatientDetail" CssClass="new-label col-xs-5" runat="server" Text="Patient is : "></asp:Label>
                                    <div class="col-xs-7">
                                        <asp:RadioButtonList ID="RbtnListRegistrationCheck" CssClass="rbl" runat="server" OnSelectedIndexChanged="RbtnListRegistrationCheck_SelectedIndexChanged" RepeatDirection="Horizontal" ValidationGroup="RegDetailsGroup" AutoPostBack="true">
                                            <asp:ListItem Text="Registered" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="New"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group" id="NewPatient" runat="server" style="margin-bottom: 20px;">
                                    <asp:Label ID="LblRegNo" runat="server" CssClass="control-label col-xs-5" Text="Registration No. :"></asp:Label>
                                    <div class="col-xs-7">
                                        <asp:TextBox ID="TxtRegNo" runat="server" CausesValidation="true" placeholder="registration number" CssClass="form-control"></asp:TextBox>
                                        <asp:Label runat="server" ID="lblError" Font-Size="Smaller" ForeColor="Red" Visible="false">Registration number not found.</asp:Label>
                                        <%--<asp:CustomValidator ID="RegNoValidation" runat="server" OnServerValidate="RegNoValidation_ServerValidate" Display="Dynamic" ControlToValidate="TxtRegNo" ErrorMessage="Registration number not found." ForeColor="Red" Font-Size="Small"  ValidationGroup="RegistrationBtn"></asp:CustomValidator>--%>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtRegNo" ErrorMessage="Please enter registration no." Display="Dynamic" ForeColor="Red" Font-Size="Small" ValidationGroup="RegistrationBtn"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group" id="RegisteredPatient" runat="server" style="margin-bottom: 20px;" visible="false">
                                    <asp:Label ID="LblRegNoNew" runat="server" CssClass="control-label col-xs-5" Text="Name :"></asp:Label>
                                    <div class="col-xs-7">
                                        <asp:TextBox ID="TxtRegNoNew" runat="server" placeholder="name of patient" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtRegNoNew" ErrorMessage="Please enter the name." Display="Dynamic" ForeColor="Red" Font-Size="Small" ValidationGroup="RegistrationBtn"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group" runat="server" style="margin-bottom: 20px;">
                                    <asp:Label ID="LblDrName" runat="server" CssClass="control-label col-xs-5" Text="Doctor Name :"></asp:Label>
                                    <div class="col-xs-7">
                                        <asp:DropDownList ID="DropDownDrName" CssClass="form-control dropdown" Height="33px" EnableViewState="true" runat="server">
                                            <asp:ListItem Value="">Select</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownDrName" ErrorMessage="Please select the doctor." Display="Dynamic" ForeColor="Red" Font-Size="Small" ValidationGroup="RegistrationBtn"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="RbtnListRegistrationCheck" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="BtnBookModal" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </asp:Panel>
            <asp:Panel ID="PanelFooterAppointment" CssClass="modal-footer" runat="server">
                <asp:Button ID="BtnCancelModal" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                <asp:Button ID="BtnBookModal" CssClass="btn btn-success" runat="server" Text="Book" CausesValidation="true" ValidationGroup="RegistrationBtn" OnClick="BtnBookModal_Click" />
            </asp:Panel>
        </asp:Panel>

        <asp:LinkButton ID="BtnDummy1" runat="server"></asp:LinkButton>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupRegno" runat="server" TargetControlID="BtnDummy1" PopupControlID="PanelRegId" BackgroundCssClass="modelBackground" CancelControlID="BtnRegnoOk">
            <Animations>
      <OnShown>
         <Fadein Duration ="0.2" />
     </OnShown>
     <OnHiding>
         <Fadeout Duration ="0.2" />
     </OnHiding>
            </Animations>
        </ajaxToolkit:ModalPopupExtender>

        <asp:Panel ID="PanelRegId" CssClass="modalpanel" runat="server">
            <asp:Panel ID="PanelSucHead" CssClass="modal-header" runat="server">
                <h2 style="color: green">Success</h2>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" CssClass="modal-body">
                <asp:Label ID="LblRegnoShow" CssClass="new-label" runat="server" Text="Your Registration Number is : "></asp:Label>
                <asp:Label ID="LblRegnoShow1" CssClass="new-label" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <asp:Panel ID="Panel4" CssClass="modal-footer" runat="server">
                <asp:Button ID="BtnRegnoOk" CssClass="btn btn-sucess" runat="server" Text="OK" />
            </asp:Panel>
        </asp:Panel>



    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
