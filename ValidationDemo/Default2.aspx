<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="ValidationDemo.Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListView runat="server" ID="ListView_tests" 
            onitemdatabound="ListView_tests_ItemDataBound">
            <ItemTemplate>
                <asp:Label ID="Label_question" runat="server" Text='<%# Eval("Question") %>' />
                <asp:CustomValidator runat="server" ErrorMessage="未填" ForeColor="Red" Display="Dynamic"
                    OnServerValidate="ValidRadioSelected" />
                <asp:Repeater runat="server" ID="Repeater_options">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:RadioButton runat="server" ID="RadioButton_option" Text='<%# Container.DataItem.ToString() %>' /></li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
                <br />
            </ItemTemplate>
        </asp:ListView>
        <asp:Button runat="server" Text="Submit" />
    </div>
    </form>
</body>
</html>
