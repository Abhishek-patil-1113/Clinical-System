<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Visit Details.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .control-label {
            color: forestgreen;
            padding-top: 9px;
        }

        .dropdown {
            height: 32px;
        }

        .form-group {
            padding-top: 5px;
            padding-bottom: 5px;
            margin-top: 14px;
            margin-bottom: 14px;
        }

        .table-success {
            font-size: large;
            color: darkgreen;
        }

        body {
            background-color: #ddfff3;
        }

        .tabContainer {
            margin: 15px;
            padding: 5px;
        }

        .table {
            margin-top: 15px;
            border: solid;
            border-color: #005339;
            border-width: 2px;
            border-radius: 0px;
        }

        .tabPanel {
            padding: 10px;
            padding-right: 25px;
            padding-left: 25px;
        }

        .padding {
            padding: 15px;
        }

        .borderMy {
            border: solid;
            border-color: #005339;
            border-width: 2px;
            padding-top: 10px;
        }

        .astr {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="margin: auto; width: 100%; text-align: center; color: forestgreen; font-size: xx-large; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bolder">
        Add visit Details
    </div>
    <hr style="height: 1px; background-color: lightgreen; margin-bottom: 30px;" />
    <div class="form-horizontal padding">
        <div class="row">
            <div class="col-xs-12 col-sm-11 col-md-6 col-lg-4 col-lg-offset-2">
                <div class="form-group ">
                    <label for="rno" class="control-label col-xs-4 col-lg-4 ">Registration no : </label>
                    <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                        <asp:TextBox ID="rno" CssClass="form-control" placeholder="registration number" runat="server" AutoPostBack="True" OnTextChanged="rno_TextChanged"></asp:TextBox>
                        <asp:DropDownList ID="rnodrop" CssClass="dropdown" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="rnodrop_SelectedIndexChanged" OnDataBound="rnodrop_DataBound">
                        </asp:DropDownList>
                        <asp:Label ID="errorStrip" runat="server" ForeColor="Red" ValidationGroup="visitDetailsGroup" Text=""></asp:Label>
                        <asp:RegularExpressionValidator ID="RE3" runat="server" Display="Dynamic" ControlToValidate="rno" ValidationGroup="visitDetailsGroup" ErrorMessage="Invalid Registration Number." ValidationExpression="^[0-9]*$" ForeColor="DarkOrange"></asp:RegularExpressionValidator>

                    </div>
                </div>

                <div class="form-group">
                    <label for="pname" class="control-label col-xs-4 col-lg-4"><span class="astr">*</span>Patient Name : </label>
                    <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                        <asp:TextBox ID="pname" CssClass="form-control" placeholder="patient name" runat="server" OnDataBinding="pname_DataBinding" OnTextChanged="pname_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" ValidationGroup="visitDetailsGroup" runat="server" ControlToValidate="pname" ErrorMessage="Please enter the name." ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="form-group">
                    <label for="page" class="control-label col-xs-4 col-lg-4">Age : </label>
                    <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                        <asp:Label ID="age" runat="server" CssClass="form-control" Text=""></asp:Label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="bloodgroup" class="control-label col-xs-4 col-lg-4">Blood Group : </label>
                    <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                        <asp:Label ID="bloodgroup" runat="server" CssClass="form-control" Text=""></asp:Label>
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-11 col-md-6 col-lg-4">
                <div class="form-group">
                    <label for="vdatetxt" class="control-label col-xs-4 col-lg-4"><span class="astr">*</span>Visit Date:</label>
                    <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                        <asp:TextBox ID="vdatetxt" CssClass="form-control" placeholder="enter visit date" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="vdate" TargetControlID="vdatetxt" runat="server" Enabled="True" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" runat="server" ValidationGroup="visitDetailsGroup" ControlToValidate="vdatetxt" ErrorMessage="Please select the date." ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vtime" class="control-label control-label col-xs-4 col-lg-4 ">Visit Time :</label>
                    <div class="col-xs-7 col-lg-8" style="margin: 0; margin-top: 6px; padding: 0">
                        <input runat="server" type="time" id="vtime" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="vtype" class="control-label col-xs-4 col-lg-4"><span class="astr">*</span>Visit Type : </label>
                    <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0;">
                        <asp:DropDownList ID="vtype" CssClass="dropdown" runat="server">
                            <asp:ListItem Value="">Select</asp:ListItem>
                            <asp:ListItem>With Appointment</asp:ListItem>
                            <asp:ListItem>Without Appointment</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ValidationGroup="visitDetailsGroup" ControlToValidate="vtype" ErrorMessage="Please select the visit type." ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="form-group">
                    <label for="dname" class="control-label col-xs-4 col-lg-4"><span class="astr">*</span>Doctor Name :</label>
                    <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                        <asp:DropDownList ID="dname" CssClass="dropdown" runat="server" DataTextField="staff_name" DataValueField="staff_id" EnableViewState="true">
                            <asp:ListItem Value="">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ValidationGroup="visitDetailsGroup" runat="server" ControlToValidate="dname" ErrorMessage="Please select the doctor name." ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label for="stname" class="control-label col-xs-4 col-lg-4"><span class="astr">*</span>Staff Name :</label>
                    <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                        <asp:DropDownList ID="stname" CssClass="dropdown" runat="server" DataTextField="staff_name" DataValueField="staff_id" EnableViewState="true">
                            <asp:ListItem Value="">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ValidationGroup="visitDetailsGroup" ControlToValidate="stname" ErrorMessage="Please select the staff name." ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>

        <hr style="height: 1px; background-color: black; margin-bottom: 30px;" />


        <div style="margin: auto; width: 100%; text-align: center; color: forestgreen; font-size: xx-large; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bolder">
            Vital signs
        </div>

        <hr style="height: 1px; background-color: lightgreen; margin-bottom: 30px;" />

        <div class="row">
            <div class="col-xs-12 col-sm-11 col-md-6 col-lg-3 col-lg-offset-3">
                <div class="form-group ">
                    <label for="tmp" class="control-label col-xs-4 col-lg-4 ">Temperature : </label>
                    <div class="col-xs-3 col-lg-3 input-group" style="margin: 0; padding: 0">
                        <asp:TextBox ID="tmp" CssClass="form-control" runat="server"></asp:TextBox>
                        <span class="input-group-addon">&#8451;</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="bp" class="control-label col-xs-4 col-lg-4">Blood Pressure : </label>
                    <div class="col-xs-6 col-lg-5 input-group" style="margin: 0; padding: 0">
                        <asp:TextBox ID="bp1" CssClass="form-control" runat="server"></asp:TextBox>
                        <span class="input-group-addon">/</span>
                        <asp:TextBox ID="bp2" CssClass="form-control" runat="server"></asp:TextBox>
                        <span class="input-group-addon">mmHg</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="oxy" class="control-label col-xs-4 col-lg-4">Oxygen Level : </label>
                    <div class="col-xs-4 col-lg-3 input-group" style="margin: 0; padding: 0">
                        <asp:TextBox ID="oxy" CssClass="form-control" runat="server"></asp:TextBox>
                        <span class="input-group-addon">&percnt; SpO&#8322;</span>
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-11 col-md-6 col-lg-3">
                <div class="form-group">
                    <label for="ht" class="control-label col-xs-4 col-lg-4">Height : </label>
                    <div class="col-xs-3 col-lg-3 input-group" style="margin: 0; padding: 0">
                        <asp:TextBox ID="ht" CssClass="form-control" runat="server"></asp:TextBox>
                        <span class="input-group-addon">ft</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="wt" class="control-label col-xs-4 col-lg-4">Weight : </label>
                    <div class="col-xs-3 col-lg-3 input-group" style="margin: 0; padding: 0">
                        <asp:TextBox ID="wt" CssClass="form-control" runat="server"></asp:TextBox>
                        <span class="input-group-addon">kg</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-3">
                <div class="form-group">
                    <label for="symptoms" class="control-label col-xs-4 col-lg-3 ">Symptoms : </label>
                    <div class="col-xs-7 col-lg-8 " style="margin: 0; padding: 0">
                        <textarea runat="server" class="form-control" placeholder="symptoms" rows="2" id="symptoms" style="height: 85px;"></textarea>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-lg-offset-3">
                <div class="form-group">
                    <label for="diagnosis" class="control-label col-xs-4 col-lg-3 ">Diagnosis : </label>
                    <div class="col-xs-7 col-lg-8 " style="margin: 0; padding: 0">
                        <textarea runat="server" class="form-control" placeholder="diagnosis" rows="2" id="diagnosis" style="height: 85px;"></textarea>
                    </div>
                </div>
            </div>
        </div>

        <a id="medicineSection"></a>
        <a id="investigationSection"></a>

        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <ajaxToolkit:TabContainer ID="visittab" runat="server" CssClass="tabContainer" ActiveTabIndex="0">
                    <ajaxToolkit:TabPanel runat="server" HeaderText="Medication" ID="medication" BackColor="#ddfff3" CssClass="tabPanel" BorderStyle="Groove">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg-4 borderMy">
                                    <div class="form-group">
                                        <label class="control-label col-lg-4 col-xs-5" for="medicines"><span class="astr">*</span>Medicine :</label>
                                        <div class="col-lg-6 col-xs-6" style="margin: 0; padding: 0;">
                                            <asp:TextBox ID="medicines" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="medicines" ValidationGroup="medicineGroup" ErrorMessage="Please select the medicine." ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-4 col-xs-5" for="freq"><span class="astr">*</span>Frequency :</label>
                                        <div class="col-lg-6 " style="margin: 0; padding: 0">
                                            <asp:DropDownList ID="freq" CssClass="dropdown" runat="server">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem>Once a day</asp:ListItem>
                                                <asp:ListItem>Twice a day</asp:ListItem>
                                                <asp:ListItem>Thrice a day</asp:ListItem>
                                                <asp:ListItem>Early morning</asp:ListItem>
                                                <asp:ListItem>Before meal</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ValidationGroup="medicineGroup" ControlToValidate="freq" ErrorMessage="Please select the frequency." ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-4 col-xs-5" for="nday"><span class="astr">*</span>No of Days :</label>
                                        <div class="col-lg-3 col-xs-5 input-group">
                                            <asp:TextBox ID="nday" CssClass="form-control" runat="server"></asp:TextBox>
                                            <span class="input-group-addon">days</span>
                                        </div>
                                        <div class="input-group col-lg-offset-4">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="medicineGroup" ControlToValidate="nday" ErrorMessage="Please enter the number." ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RE2" runat="server" Display="Dynamic" ValidationGroup="medicineGroup" ControlToValidate="nday" ErrorMessage="Enter the number of days." ValidationExpression="^[0-9]*$" ForeColor="DarkOrange"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-3 col-lg-offset-2 col-xs-4 col-xs-offset-2">
                                            <asp:Button ID="addMedi" runat="server" ValidationGroup="medicineGroup" CssClass="btn btn-info btn-block" Text="Add" OnClick="addMedi_Click" />
                                        </div>
                                        <div class="col-lg-3 col-xs-4">
                                            <asp:Button ID="clearMedi" CssClass="btn btn-default btn-block" runat="server" OnClick="clearMedi_Click" Text="Clear" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 col-lg-offset-1">
                                    <asp:GridView ID="medi" runat="server" CssClass="table table-hover table-responsive-sm table-info" GridLines="Horizontal" SelectedRowStyle-CssClass="table-danger" OnSelectedIndexChanging="medi_SelectedIndexChanging" ShowHeaderWhenEmpty="True" AllowSorting="True" HorizontalAlign="Center" OnRowDeleting="medi_RowDeleting">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-danger btn-sm" CausesValidation="False" ID="btnMediDelete"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Edit" CommandName="Select" CssClass="btn btn-secondary btn-sm" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
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
                            </div>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" CssClass="tabPanel" HeaderText="Investigation" ID="inve" BackColor="#ddfff3" BorderStyle="Groove">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg-5 borderMy">
                                    <div class="form-group">
                                        <label for="investigation" class="control-label col-xs-5 col-lg-3 "><span class="astr">*</span>Investigation : </label>
                                        <div class="col-xs-6 col-lg-8 " style="margin: 0; padding: 0">
                                            <textarea runat="server" class="form-control" placeholder="investigation" rows="2" id="investigation" style="height: 85px;"></textarea>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" ValidationGroup="investigationGroup" runat="server" ControlToValidate="investigation" ErrorMessage="Please enter the investigation." ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="result" class="control-label col-xs-5 col-lg-3 "><span class="astr">*</span>Result : </label>
                                        <div class="col-xs-6 col-lg-8 " style="margin: 0; padding: 0">
                                            <textarea runat="server" class="form-control" placeholder="result" rows="2" id="result" style="height: 85px;"></textarea>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" ValidationGroup="investigationGroup" runat="server" ControlToValidate="result" ErrorMessage="Please enter the result." ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-3 col-lg-offset-3 col-xs-4 col-xs-offset-2">
                                            <asp:Button ID="addInvestigation" ValidationGroup="investigationGroup" CssClass="btn btn-info btn-block" runat="server" Text="Add" OnClick="addInvestigation_Click" />
                                        </div>
                                        <div class="col-lg-3 col-xs-4">
                                            <asp:Button ID="clearInvestigation" CssClass="btn btn-default btn-block" runat="server" Text="Clear" OnClick="clearInvestigation_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <asp:GridView ID="invegrid" runat="server" CssClass="table table-hover table-responsive-sm table-info" GridLines="Horizontal" SelectedRowStyle-CssClass="table-danger" OnSelectedIndexChanging="invegrid_SelectedIndexChanging" OnRowDeleting="invegrid_RowDeleting" ShowHeaderWhenEmpty="True" AllowSorting="True" HorizontalAlign="Center">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-danger btn-sm" CausesValidation="False" ID="btnMediDelete"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Edit" CommandName="Select" CssClass="btn btn-secondary btn-sm" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
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
                            </div>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-3 col-xs-offset-3 col-sm-3 col-sm-offset-3 col-md-3 col-md-offset-3 col-lg-1 col-lg-offset-5" style="margin-top: 75px; display: inline-block">
                <asp:Button ID="save" runat="server" ValidationGroup="visitDetailsGroup" Text="Save" CssClass="btn btn-success btn-block" OnClick="save_Click" />
            </div>
            <div class="col-xs-3  col-sm-3 col-md-3 col-lg-1 " style="margin-top: 75px; margin-bottom: 35px; display: inline-block">
                <asp:Button ID="clear" runat="server" Text="Clear" CssClass="btn btn-default btn-block" OnClick="clear_Click" />
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function scrollToMedicineSection() {
            var element = document.getElementById("medicineSection");
            if (element) {
                element.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }

        function scrollToInvestigationSection() {
            var element = document.getElementById("investigationSection");
            if (element) {
                element.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }
        function scrollToContainer(containerId) {
            var container = document.getElementById(containerId);
            if (container) {
                container.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }
    </script>

</asp:Content>

