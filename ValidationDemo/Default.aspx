<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ValidationDemo.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            帳號:<asp:TextBox ID="Text_account" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="Text_account"
                ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator></p>
        <p>
            密碼:<asp:TextBox ID="Text_password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="Text_password"
                ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator></p>
        <p>
            1+1=<asp:TextBox ID="Text_robotVerification" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="必填" ControlToValidate="Text_robotVerification"
                ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>
            <asp:RangeValidator runat="server" ErrorMessage="1-10之間的數值" ControlToValidate="Text_robotVerification"
                ForeColor="Red" MaximumValue="10" MinimumValue="1" Display="Dynamic" Type="Integer"
                ></asp:RangeValidator>
            <asp:CustomValidator ID="CustomValidator_robotVerification" runat="server" ErrorMessage="機器人鎖認證失敗"
                ForeColor="Red" Display="Dynamic" OnServerValidate="ValidNotRobot" ></asp:CustomValidator></p>
        <asp:Button ID="Button_Submit" runat="server" Text="送出" 
            onclick="Button_Submit_Click"  />
        <asp:Button ID="Button_SubmitWithoutValidation" runat="server" Text="送出不驗證" OnClick="Button_SubmitWithoutValidation_Click"
            CausesValidation="false" />
        <asp:CustomValidator ID="CustomValidator_accountVerification" runat="server" ErrorMessage="帳密錯誤"
            ForeColor="Red" Display="Dynamic" OnServerValidate="AuthAccount" ></asp:CustomValidator>
    </div>
    </form>
</body>
</html>
