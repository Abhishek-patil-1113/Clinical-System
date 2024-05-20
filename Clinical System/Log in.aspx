<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Log in.aspx.cs" Inherits="Log_in" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous" />
    <link href="CustomStyles.css" rel="stylesheet" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f0ffff;
        }

        .main-content {
            width: 50%;
            border-radius: 20px;
            box-shadow: 0 5px 5px rgba(0,0,0,.4);
            margin: 5em auto;
            display: flex;
        }

        .company__info {
            background-color: #008080;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: #fff;
        }

        .fa-hospital-o {
            font-size: 4em;
        }

        @media screen and (max-width: 640px) {
            .main-content {
                width: 90%;
            }

            .company__info {
                display: none;
            }

            .login_form {
                border-top-left-radius: 20px;
                border-bottom-left-radius: 20px;
            }
        }

        @media screen and (min-width: 642px) and (max-width:800px) {
            .main-content {
                width: 70%;
            }
        }

        .row > h2 {
            color: #008080;
        }

        .login_form {
            background-color: #fff;
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
            border-top: 1px solid #ccc;
            border-right: 1px solid #ccc;
        }

        form {
            padding: 0 2em;
        }

        .form__input {
            width: 100%;
            border: 0px solid transparent;
            border-radius: 0;
            border-bottom: 1px solid #aaa;
            padding: 1em .5em .5em;
            padding-left: 2em;
            outline: none;
            margin: 1.5em auto;
            transition: all .5s ease;
        }

            .form__input:focus {
                border-bottom-color: #008080;
                box-shadow: 0 0 5px rgba(0,80,80,.4);
                border-radius: 4px;
            }

        .btn {
            transition: all .5s ease;
            width: 70%;
            border-radius: 30px;
            color: #008080;
            font-weight: 600;
            background-color: #fff;
            border: 1px solid #008080;
            margin-top: 1.5em;
            margin-bottom: 1em;
        }

            .btn:hover, .btn:focus {
                background-color: #008080;
                color: #fff;
            }
    </style>

</head>
<body>
    <div class="container-fluid">
        <div class="row main-content bg-success text-center">
            <div class="col-md-4 text-center company__info">
                <span class="company__logo">
                    <h2>
                        <span class="fa fa-hospital-o"></span></h2>
                </span>
                <h4 class="company_title">Life Care Clinic</h4>
            </div>
            <div class="col-md-8 col-xs-12 col-sm-12 login_form ">
                <div class="container-fluid">
                    <div class="row">
                        <h2>Log In <span class="fa fa-user-md"></span></h2>
                    </div>
                    <div class="row">
                        <form runat="server" control="" class="form-group">
                            <div class="row">
                                <input runat="server" type="text" name="username" id="username" class="form__input" placeholder="Username" required="required" />
                            </div>
                            <div class="row">
                                <input runat="server" type="password" name="password" id="password" class="form__input" placeholder="Password" required="required" />
                            </div>
                            <div class="row">
                                <input runat="server" type="checkbox" name="remember_me" id="remember_me" class="" />
                                <label for="remember_me">Remember Me!</label>
                            </div>
                            <div class="row">
                                <asp:Button class="btn" ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
                            </div>
                            <div class="row">
                                <asp:Label CssClass="alert-danger" runat="server" ID="error"></asp:Label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class=" text-center">
            <div class="col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
                <a runat="server" class="btn" href="AppointmentHome/appoitmentHome.aspx">Back to Appointment Page <span class="glyphicon glyphicon-pencil"></span></a>
            </div>
        </div>
    </div>
</body>
</html>
