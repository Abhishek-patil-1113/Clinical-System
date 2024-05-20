<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Patient Details.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .control-label {
            color: forestgreen;
            padding-top: 9px;
            margin-left: auto;
            margin-right: 0;
        }

        .dropdown {
            height: 28px;
        }

        .astr {
            color: red;
        }

        .well {
            padding: 5px;
            padding-right: 20px;
            margin-top: 20px;
            background: #bee5eb;
        }

        .form-group {
            padding-top: 5px;
            padding-bottom: 5px;
            margin-top: 14px;
            margin-bottom: 14px;
        }

        body {
            background-color: #ddfff3;
        }

        .tabContainer {
            margin: 15px;
            padding: 5px;
        }

        .rbl input[type="radio"] {
            margin-left: 15px;
            margin-right: 5px;
        }

        .table {
            margin-top: 15px;
            border: solid;
            border-color: #005339;
            border-width: 2px;
            border-radius: 0px;
        }

        .tabPanel {
            padding: 5px;
            padding-right: 5px;
            padding-left: 5px;
        }

        .borderMy {
            border: solid;
            border-color: #005339;
            border-width: 2px;
            padding-top: 10px;
        }

        .form-group {
            padding-top: 5px;
            padding-bottom: 5px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="margin: auto; width: 100%; text-align: center; color: forestgreen; font-size: xx-large; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bolder">
            Patient Details
        </div>
        <%--<hr style="height: 1px; background-color: forestgreen" />--%>
        <asp:HiddenField ID="hdnTabContainerVisible" runat="server" />

        <ajaxToolkit:TabContainer ID="patienttab" runat="server" ActiveTabIndex="0" CssClass="tabContainer" OnActiveTabChanged="patienttab_ActiveTabChanged" AutoPostBack="True">
            <ajaxToolkit:TabPanel runat="server" HeaderText="List" BackColor="#ddfff3" CssClass="tabPanel" BorderStyle="Groove" ID="stafflist">
                <ContentTemplate>
                    <div class="container">
                        <asp:GridView ID="patientlist" runat="server" CssClass="table table-hover table-responsive-sm table-info" GridLines="Horizontal" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" AllowSorting="true" HorizontalAlign="Center" OnRowDeleting="patientlist_RowDeleting" OnSelectedIndexChanging="patientlist_SelectedIndexChanging">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-sm btn-danger" ValidationGroup="nogrp" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                        <asp:LinkButton runat="server" Text="Edit" CommandName="Select" CssClass="btn btn-sm btn-secondary" ValidationGroup="nogrp" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="patient_id" SortExpression="patient_id" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("patient_id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("patient_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Name" DataField="patient_name" SortExpression="patient_name" />
                                <asp:BoundField HeaderText="City" DataField="patient_city" SortExpression="patient_city" />
                                <asp:BoundField HeaderText="Gender" DataField="patient_gender" SortExpression="patient_gender" />
                                <asp:BoundField HeaderText="Contact" DataField="patient_contact" SortExpression="patient_contact" />
                                <asp:TemplateField HeaderText="Registration Date" SortExpression="reg_dt">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("reg_dt", "{0:yyyy-MM-dd}") %>' ID="TextBox1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("reg_dt", "{0:yyyy-MM-dd}") %>' ID="Label2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available. Click on "Add" button to enter new data .. </span>
                            </EmptyDataTemplate>
                            <HeaderStyle BackColor="#005339" Font-Bold="True" Font-Size="large" ForeColor="#ddfff3" />
                            <RowStyle Font-Size="Medium" ForeColor="#005339" />
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="patientadd" runat="server" BackColor="#ddfff3" CssClass="tabPanel" BorderStyle="Groove" HeaderText="Add">
                <ContentTemplate>
                    <div class="row">
                        <form class="form-horizontal">

                            <div class="col-xs-12 col-sm-10 col-md-8 col-lg-4 col-lg-offset-4">
                                <div class="well">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <label for="name" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4"><span class="astr">*</span>Name : </label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; padding: 0">
                                                <asp:TextBox ID="name" CssClass="form-control" runat="server" placeholder="name of patient"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="PatientDetailsValidation" ControlToValidate="name" ErrorMessage="Please enter the name." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="address" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4  ">Address : </label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; padding: 0">
                                                <asp:TextBox ID="address" CssClass="form-control" runat="server" placeholder="address"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="area" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4">Area : </label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; padding: 0">
                                                <asp:TextBox ID="area" CssClass="form-control" runat="server" placeholder="area"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="city" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4"><span class="astr">*</span>City :</label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; padding: 0">
                                                <asp:TextBox ID="city" CssClass="form-control" runat="server" placeholder="city"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ValidationGroup="PatientDetailsValidation" ControlToValidate="city" ErrorMessage="Please enter the city." ForeColor="Red"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="pin" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4">Pin :</label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; padding: 0">
                                                <asp:TextBox ID="pin" CssClass="form-control" runat="server" placeholder="pin"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ValidationGroup="PatientDetailsValidation" runat="server" ControlToValidate="pin" ErrorMessage="Invalid Pin." ValidationExpression="^[0-9]{6}" ForeColor="DarkOrange"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="gender" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4"><span class="astr">*</span>Gender:</label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; margin-top: 5px; padding-top: 0;">
                                                <asp:RadioButtonList ID="gender" runat="server" RepeatLayout="Flow" CssClass="rbl" CellPadding="1" CellSpacing="1" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ValidationGroup="PatientDetailsValidation" ControlToValidate="gender" ErrorMessage="Please select the gender." ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="dob" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4">Date of Birth :</label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; padding: 0">
                                                <asp:TextBox ID="dob" CssClass="form-control" placeholder="select date of birth" runat="server"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="dob" runat="server" BehaviorID="_content_CalendarExtender1" />
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="contact" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4"><span class="astr">*</span>Contact :</label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; padding: 0">
                                                <asp:TextBox ID="contact" CssClass="form-control" placeholder="Contact" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RF3" runat="server" Display="Dynamic" ControlToValidate="contact" ValidationGroup="PatientDetailsValidation" ErrorMessage="Please enter the Mobile." ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RE3" runat="server" Display="Dynamic" ControlToValidate="contact" ValidationGroup="PatientDetailsValidation" ErrorMessage="Invalid Mobile." ValidationExpression="^[0-9]{10}" ForeColor="DarkOrange"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="email" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4"><span class="astr">*</span>Email :</label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; padding: 0">
                                                <asp:TextBox ID="email" CssClass="form-control" runat="server" placeholder="email"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ValidationGroup="PatientDetailsValidation" ControlToValidate="email" ErrorMessage="Please enter the email." ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RE2" runat="server" Display="Dynamic" ControlToValidate="email" ValidationGroup="PatientDetailsValidation" ErrorMessage="Invalid Email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="DarkOrange"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="reference" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4">Reference from :</label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; padding: 0">
                                                <asp:TextBox ID="reference" CssClass="form-control" runat="server" placeholder="reference from"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="bloodgroup" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4"><span class="astr">*</span>Blood Group:</label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; padding: 0">
                                                <asp:DropDownList ID="bloodgroup" CssClass="dropdown" runat="server">
                                                    <asp:ListItem Value="">Select</asp:ListItem>
                                                    <asp:ListItem>A+</asp:ListItem>
                                                    <asp:ListItem>B+</asp:ListItem>
                                                    <asp:ListItem>O+</asp:ListItem>
                                                    <asp:ListItem>AB+</asp:ListItem>
                                                    <asp:ListItem>A-</asp:ListItem>
                                                    <asp:ListItem>B-</asp:ListItem>
                                                    <asp:ListItem>O-</asp:ListItem>
                                                    <asp:ListItem>AB-</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ValidationGroup="PatientDetailsValidation" ControlToValidate="bloodgroup" ErrorMessage="Please select the blood group." ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <label for="dor" class="control-label col-xs-4 col-sm-4 col-md-3 col-lg-4"><span class="astr">*</span>Date of registration:</label>
                                            <div class="col-xs-8 col-sm-8 col-md-9 col-lg-8" style="margin: 0; margin-top: 6px; padding: 0">
                                                <asp:TextBox ID="dor" CssClass="form-control" placeholder="date of registration" runat="server"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" TargetControlID="dor" runat="server" BehaviorID="_content_CalendarExtender2" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server" ValidationGroup="PatientDetailsValidation" ControlToValidate="dor" ErrorMessage="Please enter the registration date." ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row form-group">
                                            <div class="col-xs-4 col-xs-offset-2  col-sm-4 col-md-4 col-lg-3 col-lg-offset-3" style="margin-top: 55px; margin-bottom: 75px; display: inline-block">
                                                <asp:Button ID="save" runat="server" Text="Save" ValidationGroup="PatientDetailsValidation" class="btn btn-success btn-block" OnClick="save_Click" />
                                            </div>
                                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-3 " style="margin-top: 55px; display: inline-block">
                                                <asp:Button ID="clear" class="btn btn-default btn-block" ValidationGroup="nogrp" runat="server" Text="Clear" OnClick="clear_Click" />
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="row">
                        <div class="col-lg-10 col-lg-offset-1">
                            <ajaxToolkit:TabContainer ID="TabContainer1" CssClass="tabContainer" runat="server" Visible="False">
                                <ajaxToolkit:TabPanel runat="server" CssClass="tabPanel" BackColor="#ddfff3" HeaderText="Allergy" ID="allergy">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <asp:GridView ID="allergygrid" runat="server" CssClass="table table-hover table-responsive-sm table-info" Width="100%" GridLines="Horizontal" OnRowCancelingEdit="allergygrid_RowCancelingEdit" OnRowEditing="allergygrid_RowEditing" OnRowUpdating="allergygrid_RowUpdating" OnRowDeleting="allergygrid_RowDeleting" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
                                                    <Columns>
                                                        <asp:TemplateField ShowHeader="False">
                                                            <EditItemTemplate>
                                                                <asp:Button ID="Button7" runat="server" CssClass="btn btn-sm btn-default" ValidationGroup="nogrp" Text="Cancel" OnClick="Button7_Click" />
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="Button2" runat="server" CausesValidation="False" CssClass="btn btn-sm btn-danger" ValidationGroup="nogrp" CommandName="Delete" Text="Delete" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="Button1" runat="server" CausesValidation="False" CssClass="btn btn-sm btn-secondary" ValidationGroup="nogrp" CommandName="Edit" Text="Edit" />
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Button ID="Button8" runat="server" CssClass="btn btn-sm btn-success" Text="Update" OnClick="Button8_Click" ValidationGroup="allUpdate" />
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="allergy_id" Visible="False">
                                                            <EditItemTemplate>
                                                                <asp:Label runat="server" ID="AllergyIdEdit" Text='<%#Bind("allergy_id") %>'></asp:Label>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_allID" Text='<%#Bind("allergy_id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Allergy Name">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("allergy") %>'></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox4" ValidationGroup="allUpdate"></asp:RequiredFieldValidator>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_allName" Text='<%#Bind("allergy") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Start Date">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox5" CssClass="form-control" Text='<%#Bind("allergy_start_dt", "{0:yyyy-MM-dd}") %>' placeholder="select start date" runat="server"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender18" runat="server" TargetControlID="TextBox5" BehaviorID="_content_CalendarExtender18" />
                                                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox5" ValidationGroup="allUpdate"></asp:RequiredFieldValidator>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_allStartDt" Text='<%#Bind("allergy_start_dt", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available. Click on "Add" button to enter new data .. </span>
                                                    </EmptyDataTemplate>
                                                    <HeaderStyle BackColor="#005339" Font-Bold="True" Font-Size="large" ForeColor="#ddfff3" />
                                                    <RowStyle Font-Size="Medium" ForeColor="#005339" />
                                                </asp:GridView>
                                            </div>
                                            <div class="col-lg-5 borderMy">
                                                <div style="margin: auto; width: 100%; text-align: center; color: forestgreen; font-size: x-large; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bolder">
                                                    Add new allergy histoy
                                                </div>
                                                <hr style="height: 1px; background-color: forestgreen" />

                                                <div class="form-group">
                                                    <label for="txtAllergy" class="control-label col-xs-4 ">Name : </label>
                                                    <div class="col-xs-8" style="margin: 0; padding: 0">
                                                        <asp:TextBox ID="txtAllergy" CssClass="form-control" placeholder="Allergy Name" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" runat="server" ValidationGroup="AllergyValidation" ControlToValidate="txtAllergy" ErrorMessage="Please enter the name." ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="allergyStart" class="control-label col-xs-4">Start Date :</label>
                                                    <div class="col-xs-8" style="margin: 0; padding: 0">
                                                        <asp:TextBox ID="allergyStart" CssClass="form-control" placeholder="Select Starting Date" runat="server"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="allergyStart" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ValidationGroup="AllergyValidation" ControlToValidate="allergyStart" ErrorMessage="Please select the start date." ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-5 col-xs-offset-1 col-sm-5 col-sm-offset-1 col-md-3 col-md-offset-3 col-lg-3 col-lg-offset-3" style="margin-top: 15px; display: inline-block">
                                                        <asp:Button ID="btnmediAdd" runat="server" OnClientClick="scrollToElement('TabContainer1');" ValidationGroup="AllergyValidation" Text="Add" class="btn btn-info btn-block" OnClick="btnmediAdd_Click" />
                                                    </div>
                                                    <div class="col-xs-5 col-sm-5 col-md-3 col-lg-3 " style="margin-top: 15px; display: inline-block; margin-bottom: 150px">
                                                        <asp:Button ID="btnmediClear" runat="server" Text="Clear" class="btn btn-default btn-block" ValidationGroup="nogrp" OnClick="btncroclear_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                                <ajaxToolkit:TabPanel runat="server" CssClass="tabPanel" BackColor="#ddfff3" HeaderText="Chronic Disease" ID="chronicdisease">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <asp:GridView ID="chronicdiseasegrid" runat="server" CssClass="table table-hover table-responsive-sm table-info" GridLines="Horizontal" Width="100%" OnRowCancelingEdit="chronicdiseasegrid_RowCancelingEdit" OnRowDeleting="chronicdiseasegrid_RowDeleting" OnRowEditing="chronicdiseasegrid_RowEditing" OnRowUpdating="chronicdiseasegrid_RowUpdating" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
                                                    <Columns>
                                                        <asp:TemplateField ShowHeader="False">
                                                            <EditItemTemplate>
                                                                <asp:Button ID="BTNcroCancel" runat="server" CssClass="btn btn-sm btn-default" Text="Cancel" ValidationGroup="nogrp" OnClick="BTNcroCancel_Click" />
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Button ID="BTNcroDelete" runat="server" CausesValidation="False" CommandName="Delete" ValidationGroup="nogrp" CssClass="btn btn-sm btn-danger" Text="Delete" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BTNcroEdit" runat="server" CausesValidation="False" CssClass="btn btn-sm btn-secondary" ValidationGroup="nogrp" CommandName="Edit" Text="Edit" />
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Button ID="BTNcroUpdate" runat="server" CssClass="btn btn-sm btn-success" Text="Update" OnClick="BTNcroUpdate_Click" ValidationGroup="VGcroUpdate" />
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="cronice_id" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_croID" Text='<%#Bind("cronic_disease_id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Label runat="server" ID="Label_croIdEdit" Text='<%#Bind("cronic_disease_id") %>'></asp:Label>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cronic Disease Name">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("cronic_disease") %>'></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox9" ValidationGroup="VGcroUpdate"></asp:RequiredFieldValidator>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_croName" Text='<%#Bind("cronic_disease") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Start Date">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox10" CssClass="form-control" Text='<%#Bind("cronic_disease_start_dt", "{0:yyyy-MM-dd}") %>' placeholder="Select start date" runat="server"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender16" runat="server" TargetControlID="TextBox10" BehaviorID="_content_CalendarExtender16" />
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox10" ValidationGroup="VGcroUpdate"></asp:RequiredFieldValidator>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_croStartDt" Text='<%#Bind("cronic_disease_start_dt", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available. Click on "Add" button to enter new data .. </span>
                                                    </EmptyDataTemplate>
                                                    <HeaderStyle BackColor="#005339" Font-Bold="True" Font-Size="large" ForeColor="#ddfff3" />
                                                    <RowStyle Font-Size="Medium" ForeColor="#005339" />
                                                </asp:GridView>
                                            </div>
                                            <div class="col-lg-5 borderMy">
                                                <div style="margin: auto; width: 100%; text-align: center; color: forestgreen; font-size: x-large; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bolder">
                                                    Add new cronic disease
                                                </div>
                                                <hr style="height: 1px; background-color: forestgreen" />

                                                <div class="form-group">
                                                    <label for="txtcronic" class="control-label col-xs-4 ">Name : </label>
                                                    <div class="col-xs-8" style="margin: 0; padding: 0">
                                                        <asp:TextBox ID="txtcronic" CssClass="form-control" placeholder="disease name" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" runat="server" ValidationGroup="CronicValidation" ControlToValidate="txtcronic" ErrorMessage="Please enter the cronic disease." ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtcronicstart" class="control-label col-xs-4">Start Date :</label>
                                                    <div class="col-xs-8" style="margin: 0; padding: 0">
                                                        <asp:TextBox ID="txtcronicstart" CssClass="form-control" placeholder="select start date" runat="server"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtcronicstart" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic" ValidationGroup="CronicValidation" ControlToValidate="txtcronicstart" ErrorMessage="Please select the start date." ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-5 col-xs-offset-1 col-sm-5 col-sm-offset-1 col-md-3 col-md-offset-3 col-lg-3 col-lg-offset-3" style="margin-top: 15px; display: inline-block">
                                                        <asp:Button ID="tbncroadd" runat="server" OnClientClick="scrollToElement('TabContainer1');" ValidationGroup="CronicValidation" Text="Add" class="btn btn-info btn-block" OnClick="tbncroadd_Click" />
                                                    </div>
                                                    <div class="col-xs-5 col-sm-5 col-md-3 col-lg-3 " style="margin-top: 15px; display: inline-block; margin-bottom: 150px">
                                                        <asp:Button ID="btncroclear" runat="server" Text="Clear" class="btn btn-default btn-block" ValidationGroup="nogrp" OnClick="btncroclear_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                                <ajaxToolkit:TabPanel runat="server" CssClass="tabPanel" BackColor="#ddfff3" HeaderText="Medication History" ID="history">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <asp:GridView ID="historygrid" runat="server" CssClass="table table-hover table-responsive-sm table-info" GridLines="Horizontal" Width="100%" OnRowUpdating="historygrid_RowUpdating" OnRowCancelingEdit="historygrid_RowCancelingEdit" OnRowEditing="historygrid_RowEditing" OnRowDeleting="historygrid_RowDeleting" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
                                                    <Columns>
                                                        <asp:TemplateField ShowHeader="False">
                                                            <EditItemTemplate>
                                                                <asp:Button ID="MediCancel" runat="server" CssClass="btn btn-sm btn-default" Text="Cancel" ValidationGroup="nogrp" OnClick="MediCancel_Click" />
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button6" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-sm btn-danger" ValidationGroup="nogrp" Text="Delete" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BTNhisEdit" runat="server" CausesValidation="False" CssClass="btn btn-sm btn-secondary" ValidationGroup="nogrp" CommandName="Edit" Text="Edit" />
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Button ID="BTNhisUpdate" runat="server" CssClass="btn btn-sm btn-success" Text="Update" OnClick="BTNhisUpdate_Click" ValidationGroup="VGhisUpdate" />
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="med_id" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_medID" Text='<%#Bind("patient_med_id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Label runat="server" ID="Label_medIdEdit" Text='<%#Bind("patient_med_id") %>'></asp:Label>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Medicine Name">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("medicine") %>'></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox18" ValidationGroup="VGhisUpdate"></asp:RequiredFieldValidator>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_medName" Text='<%#Bind("medicine") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Frequency">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("frequency") %>'></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox19" ValidationGroup="VGhisUpdate"></asp:RequiredFieldValidator>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_medFreq" Text='<%#Bind("frequency") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available. Click on "Add" button to enter new data .. </span>
                                                    </EmptyDataTemplate>
                                                    <HeaderStyle BackColor="#005339" Font-Bold="True" Font-Size="large" ForeColor="#ddfff3" />
                                                    <RowStyle Font-Size="Medium" ForeColor="#005339" />
                                                </asp:GridView>
                                            </div>
                                            <div class="col-lg-5 borderMy">
                                                <div style="margin: auto; width: 100%; text-align: center; color: forestgreen; font-size: x-large; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bolder">
                                                    Add new medicine history
                                                </div>
                                                <hr style="height: 1px; background-color: forestgreen" />

                                                <div class="form-group">
                                                    <label for="txtmediname" class="control-label col-xs-4 ">Name : </label>
                                                    <div class="col-xs-8" style="margin: 0; padding: 0">
                                                        <asp:TextBox ID="txtmediname" CssClass="form-control" placeholder="medicine name" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" runat="server" ValidationGroup="MediHistoryValidation" ControlToValidate="txtmediname" ErrorMessage="Please enter the medicine." ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtfreq" class="control-label col-xs-4 ">Frequency : </label>
                                                    <div class="col-xs-8" style="margin: 0; padding: 0">
                                                        <asp:TextBox ID="txtfreq" CssClass="form-control" placeholder="frequency" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" Display="Dynamic" runat="server" ValidationGroup="MediHistoryValidation" ControlToValidate="txtfreq" ErrorMessage="Please enter the frequency." ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-5 col-xs-offset-1 col-sm-5 col-sm-offset-1 col-md-3 col-md-offset-3 col-lg-3 col-lg-offset-3" style="margin-top: 15px; display: inline-block">
                                                        <asp:Button ID="btnmedhistoryadd" OnClientClick="scrollToElement('TabContainer1')" ValidationGroup="MediHistoryValidation" runat="server" Text="Add" class="btn btn-info btn-block" OnClick="btnmedhistoryadd_Click" />
                                                    </div>
                                                    <div class="col-xs-5 col-sm-5 col-md-3 col-lg-3 " style="margin-top: 15px; display: inline-block; margin-bottom: 150px">
                                                        <asp:Button ID="btnmedhistoryclear" runat="server" Text="Clear" class="btn btn-default btn-block" ValidationGroup="nogrp" OnClick="btnmedhistoryclear_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                            </ajaxToolkit:TabContainer>
                        </div>
                    </div>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </div>

    <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="patientmodal" runat="server" BehaviorID="patientmodal" TargetControlID="LinkButton2" PopupControlID="lgpanel" BackgroundCssClass="modelBackground" CancelControlID="ok">
        <Animations>
    <OnShown>
        <Fadein Duration ="0.45" />
    </OnShown>
    <OnHiding>
        <Fadeout Duration ="0.45" />
    </OnHiding>
        </Animations>
    </ajaxToolkit:ModalPopupExtender>

    <asp:Panel ID="lgpanel" CssClass="modalpanel" runat="server">
        <asp:Panel ID="Panel1" CssClass="modal-header" runat="server">
            <h2 style="color: green">Success</h2>
        </asp:Panel>
        <asp:Panel ID="Panel2" CssClass="modal-body" HorizontalAlign="Left" runat="server">
            <h4>Patient details updated succesfully.</h4>
            <h4>Insert the further optional details below.</h4>
        </asp:Panel>
        <asp:Panel ID="Panel3" CssClass="modal-footer" runat="server">
            <asp:Button ID="ok" CssClass="btn btn-success" runat="server" ValidationGroup="nogrp" Text="OK" />
        </asp:Panel>
    </asp:Panel>

    <asp:LinkButton ID="btnDelPmodal" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="delpatientmodal" runat="server" TargetControlID="btnDelPmodal" PopupControlID="Panel4" BackgroundCssClass="modelBackground" CancelControlID="btncancel">
        <Animations>
         <OnShown>
            <Fadein Duration ="0.2" />
        </OnShown>
        <OnHiding>
            <Fadeout Duration ="0.2" />
        </OnHiding>
        </Animations>
    </ajaxToolkit:ModalPopupExtender>

    <asp:Panel ID="Panel4" CssClass="modalpanel" runat="server">
        <asp:Panel ID="Panel5" CssClass="modal-header" runat="server">
            <h2 style="color: red">Delete</h2>
        </asp:Panel>
        <asp:Panel ID="Panel6" CssClass="modal-body" HorizontalAlign="Left" runat="server">
            <h4>Confirm delete ?</h4>
        </asp:Panel>
        <asp:Panel ID="Panel7" CssClass="modal-footer" runat="server">
            <asp:Button ID="btncancel" CssClass="btn btn-success" runat="server" ValidationGroup="nogrp" Text="Cancel" />
            <asp:Button ID="btndel" CssClass="btn btn-danger" runat="server" ValidationGroup="nogrp" Text="Delete" OnClick="btndel_Click" />
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
       <asp:Panel ID="Panel8" runat="server" CssClass="modal-body">
           <asp:Label ID="LblRegnoShow" CssClass="new-label" runat="server" Text="Your Registration Number is : "></asp:Label>
           <asp:Label ID="LblRegnoShow1" CssClass="new-label" runat="server" Text=""></asp:Label>
       </asp:Panel>
       <asp:Panel ID="Panel9" CssClass="modal-footer" runat="server">
           <asp:Button ID="BtnRegnoOk" CssClass="btn btn-sucess" runat="server" Text="OK" />
       </asp:Panel>
   </asp:Panel>

    <script type="text/javascript">
        function scrollToBottom() {
            window.scrollTo(0, document.body.scrollHeight);
        }
        function scrollToElement(elementId) {
            var element = document.getElementById(elementId);
            if (element) {
                element.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }
        function scrollToElement(elementId) {
            var element = document.getElementById(elementId);
            if (element) {
                element.scrollIntoView();
            }
        }
        function scrollToTabContainer() {
            var tabContainerVisible = document.getElementById('<%= hdnTabContainerVisible.ClientID %>').value;
            if (tabContainerVisible === "true") {
                var tabContainer = document.getElementById('<%= TabContainer1.ClientID %>');
                if (tabContainer) {
                    tabContainer.scrollIntoView();
                }
            }
        }
        window.onload = scrollToTabContainer;

    </script>
</asp:Content>
