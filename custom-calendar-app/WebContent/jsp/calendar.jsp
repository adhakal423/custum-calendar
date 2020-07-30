<%@ page import="com.neo.calendar.Month,java.util.*,util.*,java.io.*,java.sql.*,com.neo.*" errorPage="error.jsp" %>
<%-- TODO: CLEAN UP THE PAGE TAG ABOVE --%>
<%@ include file="calendarCommon.jsp" %>


<html>
<head>

<Style>
.regular_page
 {
  font: 0.8em Verdana;
  text-align:center;
  padding-top: 1200 px;
}

.month_year_header
 {
 
 width:200px;
 height:70px;
 background-color:#0080ff;
  color:white;
   text-align:center;
   font-size:40px;
   
   border-style:dotted solid ;
border-color:rgb(0,0,255);

 }


.empty_day_cell {
	
	color:green;
}
.submit_button {
	
 background-color:#1a91b3;
 color:white;
 
 width:100px;
 height:30px;
 
	
}

.submit_button_one {
 background-color:#1a91b3;
 color:white;
 
 width:100px;
 height:30px;
 	
}


.submit_button_two {
 background-color:#1a91b3;
 color:white;
 width:100px;
 height:30px;
}

.calendar_main_div
{
  padding-top: 1200 px;
  padding-left: 1200 px;

}
#calendar_table{
padding-top: 1200 px;
padding-left: 1200 px;
}

#next_month_link{
}

.btncolor:focus{
      
    background-color:lightgreen;    
}

.today_cell{

    background-color:#ffff0d;    


}
.btncolor{


}

#calendar_table{

border:5px dotted blue;
border-color:rgb(0,0,255);

}

.header_discription
 {
 
 height:30px;
 background-color:#e1ffe1;
	  color:#006a00;
   text-align:center;
 
 }

.header_discription_below
 {
 
 height:30px;
 background-color:#ffffdf;
 color:#ff8c1a;
 text-align:center;
 
 }
 
 
 
.week_data_row{



}

.close:hover {
  opacity: 1;
}
.close:before, .close:after {
  position: relative;
  left: 10px;
  content: ' ';
  height: 10px;
  width: 2px;
  background-color: #333;
}
.close:before {
  transform: rotate(45deg);
}
.close:after {
  transform: rotate(-45deg);
}






</Style>

</head>


<body class="regular_page">

<table class="header">
 
 <tr> 
 <td class="header_discription" width="100%">
 
today date is <%= currentDayInt%> <%= monthName%> <%= intYear %> <span class="close">X</span>

 </td>
 </tr>

<tr> 
 <td class="header_discription_below" width="100%">
 
 
 the selected date is on the future <span class="close">X</span>
 

 </td>
 </tr>




</table>




<table id="calendar_nav_table" border="0">
  <tr>
    
    
     <td id="prev_year_link">
      <form method="post">
        <input class="submit_button" type="submit" name="PREV" value=" Last year ">
        <input type="hidden" name="month" value="<%=prevMonth+1%>">
        <input type="hidden" name="year" value="<%=prevYear-1%>">
      </form>
    </td>
    
    
    <td id="prev_month_link">
      <form method="post">
        <input class="submit_button" type="submit" name="PREV" value=" Last month ">
        <input type="hidden" name="month" value="<%=prevMonth%>">
        <input type="hidden" name="year" value="<%=prevYear%>">
      </form>
    </td>
    
    <td id="next_month_link">
      <form method="post">
        <input class="submit_button_one" type="submit" name="NEXT" value="Next month ">
        <input type="hidden" name="month" value="<%=nextMonth%>">
        <input type="hidden" name="year" value="<%=nextYear%>">
      </form>
     
    </td>  
    
    <td id="next_year_link">
      <form method="post">
        <input class="submit_button_two" type="submit" name="NEXT" value="Next year ">
        <input type="hidden" name="month" value="<%=prevMonth+1%>">
        <input type="hidden" name="year" value="<%=nextYear+1%>">
      </form>
     
    </td>
    
    
  </tr>
</table>






<div class="calendar_main_div">
<table border="1"  cellspacing="0" cellpadding="10" id="calendar_table">

  <tr>
    <td width="100%" colspan="7" class="month_year_header">
      <%= monthName %>,<%= intYear %>
    </td>
  </tr>
  <tr class="week_header_row">
    <th width="14%" class="th_day_cell day">Sun</th>
    <th width="14%" class="th_day_cell day">Mon</th>
    <th width="14%" class="th_day_cell day">Tue</th>
    <th width="14%" class="th_day_cell day">Wed</th>
    <th width="14%" class="th_day_cell day">Thu</th>
    <th width="15%" class="th_day_cell day">Fri</th>
    <th width="15%" class="th_day_cell day">Sat</th>
  </tr>
  
  
  
<%
{
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  int [][] days = aMonth.getDays();
  for( int i=0; i<aMonth.getNumberOfWeeks(); i++ )
  {
    %><tr class="week_data_row"><%
    for( int j=0; j<7; j++ )
    {
      if( days[i][j] == 0 )
      {
        %><td class="empty_day_cell">&nbsp;</td><%
      }
      else
      {
        // this is "today"
        if( currentDayInt == days[i][j] && currentMonthInt == aMonth.getMonth() && currentYearInt == aMonth.getYear() )
        {
          %><td class="today_cell"><input class="btncolor" type="submit" name="submit" value="<%=days[i][j]%>"> </td><%   
        		  
        }
        else
        {
        	  %>
        	   <td class="day_cell"><input class="btncolor" type="submit" name="submit" value="<%=days[i][j]%>"> </td>       
        	  <%--<td class="day_cell"><a href="linkall"><%=days[i][j]%></a></td>--%>
        	  
        	  
             <%       	
             
        }
      } 
    } 
    %>
 </tr>
  <%}
}
%>
</table>

</div>



</body>
</html>


