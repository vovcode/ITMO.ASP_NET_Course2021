﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="RSVP.Summary" %>
<%@ Import Namespace="RSVP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv ="content-type" content ="text/html"; charset="utf-8"/>
    <title>Участники семинара</title>
    <link rel="stylesheet" href="Styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Приглашения</h2>
            <h3>Выступающие с докладом: </h3>
            <table>
                <thead>
                    <tr>
                        <th>Имя</th>
                        <th>Email</th>
                        <th>Телефон</th>

                    </tr>
                </thead>
                <tbody>
                    <% var yesData = ResponseRepository.GetRepository().GetAllResponses()
                        .Where(r => r.WillAttend.Value);
                    foreach (var rsvp in yesData)
                        {
                            string htmlString = String.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td>", rsvp.Name, rsvp.Email, rsvp.Phone, rsvp.Rdata);
                            Response.Write(htmlString);
                        }
                    %>
                </tbody>
            </table>
            <h3>Участники без доклада: </h3>
            <table>
                <thead>
                    <tr>
                        <th>Имя</th>
                        <th>Email</th>
                        <th>Телефон</th>
                    </tr>
                </thead>
                <tbody>
                    <%= GetNoShowHtml()%>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
