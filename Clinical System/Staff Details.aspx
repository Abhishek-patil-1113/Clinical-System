<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Staff Details.aspx.cs" Inherits="_Default" %>

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
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .well {
            padding: 5px;
            margin-top: 20px;
            background: #bee5eb;
        }

        .rbl input[type="radio"] {
            margin-left: 15px;
            margin-right: 5px;
        }

        .astr {
            color: red;
        }

        body{
            background-color:#ddfff3;
        }
        .tabContainer{
            margin:10px;
        }

        .table{
            margin-top : 15px;
            border:solid;
            border-color : #005339;
            border-width:2px;
            border-radius:0px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="margin: auto; width: 100%; text-align: center; color: forestgreen; font-size: xx-large; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bolder">
            Staff Details
        </div>
        <%--<hr style="height: 1px; background-color: forestgreen; margin-bottom: 30px;" />--%>
        <ajaxToolkit:TabContainer ID="stafftab" runat="server" CssClass="tabContainer" ActiveTabIndex="0" OnActiveTabChanged="stafftab_ActiveTabChanged" AutoPostBack="True">
            <ajaxToolkit:TabPanel runat="server" HeaderText="List"  ID="stafflist" BackColor="#ddfff3"  BorderStyle="Groove">
                <ContentTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="table table-hover table-responsive-sm table-info" GridLines="Horizontal" ShowHeaderWhenEmpty="True" AllowSorting="True" HorizontalAlign="Center" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-sm btn-danger" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text="Edit" CommandName="Select" CssClass="btn btn-sm btn-secondary" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="ID" Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("staff_id") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("staff_id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="staff_name" HeaderText="Name" />
                                        <asp:BoundField DataField="staff_city" HeaderText="City" />
                                        <asp:BoundField DataField="staff_gender" HeaderText="Gender" />
                                        <asp:BoundField DataField="Staff_contact" HeaderText="Contact" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <span style="font-size: 12px; font-weight: bold; color: Blue;">No records are available. Click on "Add" button to enter new data .. </span>
                                    </EmptyDataTemplate>

                                    <HeaderStyle BackColor="#005339" Font-Bold="True" Font-Size="large" ForeColor="#ddfff3" />
                                    <RowStyle  Font-Size="Medium" ForeColor="#005339" />

                                    <%--<EditRowStyle BackColor="#7C6F57" />--%>
                                    <%--<AlternatingRowStyle BackColor="White" />--%>
                                    <%--<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />--%>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="staffadd" runat="server" BackColor="#ddfff3" BorderStyle="Groove" HeaderText="Add">
                <ContentTemplate>
                    <form class="form-horizontal">
                        <div class="row" style="margin-top:25px">
                            <div class="col-xs-12 col-sm-11 col-md-6 col-lg-4 col-lg-offset-2">
                                <div class="well" style= "padding-bottom:45px; padding-right:19px; border-radius:20px;">
                                    <div class="form-group ">
                                        <label for="sname" class="control-label col-xs-3 col-lg-4 "><span class="astr">*</span>Name : </label>
                                        <div class="col-xs-9 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="sname" CssClass="form-control" runat="server" placeholder="name of staff"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="staffDetailsValidation" ControlToValidate="sname" ErrorMessage="Please enter the Name." ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="gender" class="control-label col-xs-3 col-lg-4 "><span class="astr">*</span>Gender:</label>
                                        <div class="col-xs-9 col-lg-8" style="margin: 0; padding-top: 0;">
                                            <asp:RadioButtonList ID="gender" runat="server" RepeatLayout="Flow" CssClass="rbl" CellPadding="1" CellSpacing="1" OnSelectedIndexChanged="gender_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="staffDetailsValidation" ControlToValidate="gender" ErrorMessage="Please select the gender." ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="aadhar" class="control-label col-xs-3 col-lg-4"><span class="astr">*</span>Aadhar : </label>
                                        <div class="col-xs-9 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="aadhar" CssClass="form-control" placeholder="Aadhar card number" type="text" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="staffDetailsValidation" ControlToValidate="aadhar" ErrorMessage="Please enter aadhar number." ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="staffDetailsValidation" ControlToValidate="aadhar" ErrorMessage="Invalid Aadhar number." ValidationExpression="^[0-9]{12}" ForeColor="DarkOrange"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="dob" class="control-label col-xs-3 col-lg-4">Date of Birth :</label>
                                        <div class="col-xs-9 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="dob" CssClass="form-control" placeholder="select date of birth" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="dob" runat="server" BehaviorID="_content_CalendarExtender1" />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="doj" class="control-label col-xs-3 col-lg-4">Joining Date:</label>
                                        <div class="col-xs-9 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="doj" CssClass="form-control" placeholder="select date of joining" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" TargetControlID="doj" runat="server" BehaviorID="_content_CalendarExtender2" />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="qualification" class="control-label col-xs-3 col-lg-4">Qualification : </label>
                                        <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0;">
                                            <asp:DropDownList ID="Qualification" CssClass="dropdown" runat="server" OnSelectedIndexChanged="Qualification_SelectedIndexChanged">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem>MBBS</asp:ListItem>
                                                <asp:ListItem>MD</asp:ListItem>
                                                <asp:ListItem>BAMS</asp:ListItem>
                                                <asp:ListItem>BHMS</asp:ListItem>
                                                <asp:ListItem>MS</asp:ListItem>
                                                <asp:ListItem>D. Pharma</asp:ListItem>
                                                <asp:ListItem>B. Pharma</asp:ListItem>
                                                <asp:ListItem>M. Pharma</asp:ListItem>
                                                <asp:ListItem>B.SC.(N)</asp:ListItem>
                                                <asp:ListItem>M.SC.(N)</asp:ListItem>
                                                <asp:ListItem>10th</asp:ListItem>
                                                <asp:ListItem>12th</asp:ListItem>
                                                <asp:ListItem>Other Graduate</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="experience" class="control-label col-xs-3 col-lg-4">Experience :</label>
                                        <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="experience" CssClass="form-control" runat="server" placeholder="experience"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="worktype" class="control-label col-xs-3 col-lg-4">Work Type :</label>
                                        <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:DropDownList ID="worktype" CssClass="dropdown" runat="server">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem>Doctor</asp:ListItem>
                                                <asp:ListItem>Pharmacist</asp:ListItem>
                                                <asp:ListItem>Ward Boy</asp:ListItem>
                                                <asp:ListItem>Nurse</asp:ListItem>
                                                <asp:ListItem>Receptionist</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-11 col-md-6 col-lg-4">
                                <div class="well" style="padding-bottom: 45px; border-radius:20px;">
                                    <div class="form-group">
                                        <label for="address" class="control-label col-xs-3 col-lg-3 ">Address : </label>
                                        <div class="col-xs-7 col-lg-8 " style="margin: 0; padding: 0">
                                            <textarea class="form-control" runat="server" placeholder="address" rows="2" id="address" style="height: 105px;"></textarea>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group" style="margin-top: 86px">
                                        <label for="area" class="control-label col-xs-3 col-lg-3">Area : </label>
                                        <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="area" CssClass="form-control" runat="server" placeholder="area"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="city" class="control-label col-xs-3 col-lg-3"><span class="astr">*</span>City : </label>
                                        <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="city" CssClass="form-control" runat="server" placeholder="city"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="staffDetailsValidation" ControlToValidate="city" ErrorMessage="Please enter the City." ForeColor="Red"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="pin" class="control-label col-xs-3 col-lg-3 ">Pin :</label>
                                        <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="pin" CssClass="form-control" placeholder="pin" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="staffDetailsValidation" ControlToValidate="pin" ErrorMessage="Invalid Pin." ValidationExpression="^[0-9]{6}" ForeColor="DarkOrange"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="contact" class="control-label col-xs-3 col-lg-3 "><span class="astr">*</span>Contact :</label>
                                        <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="contact" runat="server" class=" form-control" placeholder="contact"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RF3" runat="server" ControlToValidate="contact" ValidationGroup="staffDetailsValidation" ErrorMessage="Please enter the Mobile." ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RE3" runat="server" ControlToValidate="contact" ValidationGroup="staffDetailsValidation" ErrorMessage="Invalid Mobile." ValidationExpression="^[0-9]{10}" ForeColor="DarkOrange"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="email" class="control-label col-xs-3 col-lg-3"><span class="astr">*</span>Email :</label>
                                        <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="email" CssClass="form-control" runat="server" placeholder="email"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="email" ValidationGroup="staffDetailsValidation" ErrorMessage="Please enter the Email." ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RE2" runat="server" ControlToValidate="email" ValidationGroup="staffDetailsValidation" ErrorMessage="Invalid Email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="DarkOrange"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label for="password" class="control-label col-xs-3 col-lg-3"><span class="astr">*</span>Password :</label>
                                        <div class="col-xs-7 col-lg-8" style="margin: 0; padding: 0">
                                            <asp:TextBox ID="password" CssClass="form-control" runat="server" placeholder="password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="staffDetailsValidation" ControlToValidate="password" ErrorMessage="Please enter the Password." ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-3 col-xs-offset-3 col-sm-3 col-sm-offset-3 col-md-3 col-md-offset-3 col-lg-1 col-lg-offset-5" style="margin-top: 30px; display: inline-block">
                                <asp:Button ID="save" runat="server" Text="Save" class="btn btn-success btn-block" ValidationGroup="staffDetailsValidation" type="submit" OnClick="save_Click" />
                            </div>

                            <div class="col-xs-3  col-sm-3 col-md-3 col-lg-1 " style="margin-top: 30px; margin-bottom: 35px; display: inline-block">
                                <asp:Button ID="clear" runat="server" Text="Clear" class="btn btn-default btn-block" OnClick="clear_Click" />
                            </div>
                        </div>
                    </form>

                </ContentTemplate>
            </ajaxToolkit:TabPanel>

        </ajaxToolkit:TabContainer>
    </div>

    <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="staffmodal" runat="server" BehaviorID="staffmodal" TargetControlID="LinkButton2" PopupControlID="lgpanel" BackgroundCssClass="modelBackground" CancelControlID="ok">
        <Animations>
        <OnShown>
            <Fadein Duration ="0.3" />
        </OnShown>
        <OnHiding>
            <Fadeout Duration ="0.3" />
        </OnHiding>
        </Animations>
    </ajaxToolkit:ModalPopupExtender>

    <asp:Panel ID="lgpanel" CssClass="modalpanel" runat="server">
        <asp:Panel ID="Panel1" CssClass="modal-header" runat="server">
            <h2 style="color: green">Success</h2>
        </asp:Panel>
        <asp:Panel ID="Panel2" CssClass="modal-body" HorizontalAlign="Left" runat="server">
            <h4>Staff details updated succesfully.</h4>
        </asp:Panel>
        <asp:Panel ID="Panel3" CssClass="modal-footer" runat="server">
            <asp:Button ID="ok" CssClass="btn btn-success" runat="server" Text="OK" />
        </asp:Panel>
    </asp:Panel>


    <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="delstaffmodal" runat="server" TargetControlID="LinkButton3" PopupControlID="Panel4" BackgroundCssClass="modelBackground" CancelControlID="btncancel">
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
            <asp:Button ID="btncancel" CssClass="btn btn-success" runat="server" Text="Cancel" />
            <asp:Button ID="btndel" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="btndel_Click" />
        </asp:Panel>
    </asp:Panel>

</asp:Content>

