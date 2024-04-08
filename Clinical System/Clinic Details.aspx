<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Clinic Details.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .control-label {
            color: forestgreen;
        }

        body {
            background-color: #ddfff3;
        }

        .well {
            padding: 5px;
            margin-top: 30px;
            background: #bee5eb;
        }

        .astr {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-10 col-md-8 col-lg-6 col-lg-offset-3">
                <div class="well">
                    <div style="margin: auto; width: 100%; text-align: center; color: forestgreen; font-size: xx-large; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bolder">
                        Clinic Details
                    </div>
                    <hr style="height: 1px; background-color: forestgreen" />
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="name" class="control-label col-xs-3 "><span class="astr">*</span>Name : </label>
                            <div class="col-xs-7" style="margin: 0; padding: 0">
                                <asp:TextBox ID="name" CssClass="form-control" placeholder="name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="name" ValidationGroup="ClinicDetailValidation" ErrorMessage="Please enter the Name." ForeColor="Red"></asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address" class="control-label col-xs-3 ">Address : </label>
                            <div class="col-xs-7" style="margin: 0; padding: 0">
                                <asp:TextBox ID="address" CssClass="form-control" placeholder="address" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="area" class="control-label col-xs-3 ">Area : </label>
                            <div class="col-xs-7" style="margin: 0; padding: 0">
                                <asp:TextBox ID="area" CssClass="form-control" placeholder="area" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="city" class="control-label col-xs-3 "><span class="astr">*</span>City :</label>
                            <div class="col-xs-7" style="margin: 0; padding: 0">
                                <asp:TextBox ID="city" CssClass="form-control" placeholder="city" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ClinicDetailValidation" ControlToValidate="city" ErrorMessage="Please enter the City." ForeColor="Red"></asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label for="pin" class="control-label col-xs-3 ">Pin :</label>
                            <div class="col-xs-7" style="margin: 0; padding: 0">
                                <asp:TextBox ID="pin" CssClass="form-control" placeholder="pin" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="ClinicDetailValidation" ControlToValidate="pin" ErrorMessage="Invalid Pin." ValidationExpression="^[0-9]{6}" ForeColor="DarkOrange"></asp:RegularExpressionValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label for="contact" class="control-label col-xs-3 "><span class="astr">*</span>Contact :</label>
                            <div class="col-xs-7" style="margin: 0; padding: 0">
                                <asp:TextBox ID="contact" CssClass="form-control" placeholder="Contact" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RF3" runat="server" ControlToValidate="contact" ValidationGroup="ClinicDetailValidation" ErrorMessage="Please enter the Mobile." ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RE3" runat="server" ControlToValidate="contact" ValidationGroup="ClinicDetailValidation" ErrorMessage="Invalid Mobile." ValidationExpression="^[0-9]{10}" ForeColor="DarkOrange"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="website" class="control-label col-xs-3 ">Website :</label>
                            <div class="col-xs-7" style="margin: 0; padding: 0">
                                <asp:TextBox ID="website" CssClass="form-control" placeholder="website" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="control-label col-xs-3 "><span class="astr">*</span>Email :</label>
                            <div class="col-xs-7" style="margin: 0; padding: 0">
                                <asp:TextBox ID="email" CssClass="form-control" placeholder="email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RF2" runat="server" ControlToValidate="email" ValidationGroup="ClinicDetailValidation" ErrorMessage="Please enter the Email." ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RE2" runat="server" ControlToValidate="email" ValidationGroup="ClinicDetailValidation" ErrorMessage="Invalid Email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="DarkOrange"></asp:RegularExpressionValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label for="starttime" class="control-label col-xs-5 col-sm-5 col-md-3"><span class="astr">*</span>Start Time :</label>
                            <div class="col-xs-7" style="margin: 0; padding: 0">
                                <input runat="server" type="time" id="starttime" required="required" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="endtime" class="control-label col-xs-5 col-sm-5 col-md-3"><span class="astr">*</span>End Time :</label>
                            <div class="col-xs-7" style="margin: 0; padding: 0">
                                <input runat="server" type="time" id="endtime" required="required" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-3 col-xs-offset-3 col-sm-3 col-sm-offset-3 col-md-3 col-md-offset-3 col-lg-3 col-lg-offset-3" style="margin-top: 15px; display: inline-block">
                                <asp:Button ID="save" runat="server" Text="Save" ValidationGroup="ClinicDetailValidation" class="btn btn-success btn-block" type="submit" OnClick="save_Click" />
                            </div>
                            <div class="col-xs-3 col-sm-4 col-md-3 col-lg-3 " style="margin-top: 15px; display: inline-block">
                                <asp:Button ID="clear" runat="server" Text="Clear" class="btn btn-default btn-block" OnClick="clear_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="clinicDt" runat="server" BehaviorID="clinicDt" TargetControlID="LinkButton2" PopupControlID="lgpanel" BackgroundCssClass="modelBackground" CancelControlID="ok">
        <Animations>
        <OnShown>
            <Fadein Duration ="0.2" />
        </OnShown>
        <OnHiding>
            <Fadeout Duration ="0.2" />
        </OnHiding>
        </Animations>
    </ajaxToolkit:ModalPopupExtender>

    <asp:Panel ID="lgpanel" CssClass="modalpanel" runat="server">
        <asp:Panel ID="Panel1" CssClass="modal-header" runat="server">
            <h2 style="color: green">Success</h2>
        </asp:Panel>
        <asp:Panel ID="Panel2" CssClass="modal-body" HorizontalAlign="Left" runat="server">
            <h4>Clinic details updated succesfully.</h4>
        </asp:Panel>
        <asp:Panel ID="Panel3" CssClass="modal-footer" runat="server">
            <asp:Button ID="ok" CssClass="btn btn-success" runat="server" Text="OK" />
        </asp:Panel>
    </asp:Panel>

</asp:Content>
