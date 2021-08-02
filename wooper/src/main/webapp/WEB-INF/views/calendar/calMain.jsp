<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='/api/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='/api/resources/fullcalendar/main.js'></script>

<style>
	#calendar{
		width: 1000px;
		height: 600px;
	}
</style>
</head>
<body>

	 <div id='calendar'></div>
	 
	 <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
</body>
</html>