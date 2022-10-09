import FullCalendar from "@fullcalendar/react"; // must go before plugins
import dayGridPlugin from "@fullcalendar/daygrid"; // a plugin!
import interactionPlugin from "@fullcalendar/interaction";
import { useState } from "react";

function getDaysInMonthUTC(month, year) {
  var date = new Date(Date.UTC(year, month, 1));
  var days = [];
  while (date.getUTCMonth() === month) {
    days.push(new Date(date));
    date.setUTCDate(date.getUTCDate() + 1);
  }
  return days;
}
const today = new Date();
const prices = getDaysInMonthUTC(8, 2022).map((d) => {
  if (d < today) {
    return {
      date: d.toISOString().slice(0, 10),
      display: "background",
      backgroundColor: "grey",
    };
  }
  return { title: "500.000 đ", date: d.toISOString().slice(0, 10) };
});

function PriceCalendar() {
  const [date, setDate] = useState("date 1");
  const handleDateClick = (args) => {
    console.log(args);
    setDate(args.dateStr);
  };
  return (
    <div className="canlendar-container">
      <div className="canlendar-card">
        <div style={{ margin: "20px" }}>
          <FullCalendar
            events={prices}
            plugins={[dayGridPlugin, interactionPlugin]}
            initialView="dayGridMonth"
            dateClick={handleDateClick}
            eventContent={renderEventContent}
            
          />
        </div>
      </div>
      <div className="date-detail">{date}</div>
    </div>
  );
}

export default PriceCalendar;

function renderEventContent(eventInfo) {
  return (
    <div style={{ backgroundColor: "grey" }}>
      <i>{eventInfo.event.title}</i>
    </div>
  );
}
