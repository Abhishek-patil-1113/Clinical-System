<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Log in.aspx.cs" Inherits="Log_in" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous" />
    <link href="CustomStyles.css" rel="stylesheet" />

    <style>
        .astr {
            color: red;
        }

        body {
            background-color: #ddfff3;
            color:#17a2b8;
        }
    </style>

</head>
<body>
    <%--<div class="container">--%>
    <div class="row" style="margin-top: 17%">
        <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
            <div class="well">
                <div style="margin: auto; width: 100%; text-align: center; color:forestgreen; font-size: xx-large; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bolder">
                    Log in
                </div>
                <hr style="color: black" />
                <form class="form-horizontal" runat="server">
                    <div class="form-group">
                        <label for="inputusername" class="control-label col-xs-3 "><span class="astr">*</span>Login</label>
                        <div class="col-xs-7" style="margin: 0; padding: 0">
                            <input runat="server" class=" form-control" placeholder="Login" type="text" id="inputusername" required="required" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputpassword" class="control-label col-xs-3 "><span class="astr">*</span>Password</label>
                        <div class="col-xs-7" style="margin: 0; padding: 0">
                            <input runat="server" class=" form-control" placeholder="Password" type="password" id="inputuserpassword" required="required" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-8 col-xs-offset-3 col-sm-8 col-sm-offset-3 col-md-6 col-md-offset-4 col-lg-6 col-lg-offset-4">
                            <div style="margin: 3px; width: 30%; display: inline-block">
                                <asp:Button CssClass="btn btn-success btn-block" ID="submit" runat="server" Text="Submit" OnClick="submit_Click1" />
                            </div>
                            <div style="margin: 3px; width: 30%; display: inline-block">
                                <asp:Button CssClass="btn btn-info btn-block" ID="clear" runat="server" Text="Clear" OnClientClick="this.form.reset();return false;" />
                            </div>
                            <div>
                                <asp:Label CssClass="alert-danger" runat="server" ID="error"></asp:Label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%--</div>--%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
