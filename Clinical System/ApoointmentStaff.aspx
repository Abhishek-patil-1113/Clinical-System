<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ApoointmentStaff.aspx.cs" Inherits="ApoointmentStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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

        .btn-light {
            /*color:blueviolet;*/
            background-color: skyblue;
        }

        .table {
            margin-top: 15px;
            border: solid;
            border-color: #005339;
            border-width: 2px;
            border-radius: 0px;
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
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="margin: auto; width: 100%; text-align: center; margin-bottom: 25px; color: forestgreen; font-size: xx-large; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bolder">
        Appointment Details
    </div>
    <hr style="height: 1px; background-color: lightgreen; margin-bottom: 30px;" />
    
    <div class="table-responsive">
        <div id="TablePlace" runat="server" class="container col-xs-12 col-lg-8 col-lg-offset-2">
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
            <h2 style="color: red">Book Appointment</h2>
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
                    <%--<asp:AsyncPostBackTrigger ControlID="RbtnListRegistrationCheck" EventName="BtnBookModal_Click" />--%>
                    <asp:AsyncPostBackTrigger ControlID="BtnBookModal" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel ID="PanelFooterAppointment" CssClass="modal-footer" runat="server">
            <asp:Button ID="BtnCancelModal" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
            <asp:Button ID="BtnBookModal" CssClass="btn btn-success" runat="server" Text="Book" CausesValidation="true" ValidationGroup="RegistrationBtn" OnClick="BtnBookModal_Click" />
        </asp:Panel>
    </asp:Panel>
</asp:Content>

