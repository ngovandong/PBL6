// import './App.css';
import { Routes, Route, BrowserRouter, Navigate } from "react-router-dom";
import Home from "../pages/home";
import Login from "../pages/login";
import SignUp from "../pages/signup";
import NotFound from "../pages/Notfound";
import Accommodation from "../pages/accomodation";
import Profile from "../pages/profile";
import PrivateContainer from "../components/PrivateContainer";
import UnfinishedPage from "../pages/accomodation/UnfinishedPage";
import ActivePage from "../pages/accomodation/ActivePage";
import DeactivatedPage from "../pages/accomodation/DeactivatedPage";
import NewAccommodation from "../pages/newAccommodation";
import { ThemeProvider } from "@emotion/react";
import theme from "./colorTheme";
import VerifySignup from "../pages/signup/VerifySignup";
import ConfirmSignup from "../pages/signup/ConfirmSignup";
import Notification from "../pages/notification";
import Detail from "../pages/Detail";
import InfoTab from "../pages/Detail/InfoTab";
import MessageTab from "../pages/Detail/MessageTab";
import CalendarTab from "../pages/Detail/CalendarTab";
import RevenueTab from "../pages/Detail/RevenueTab";
import RoomTab from "../pages/Detail/RoomTab";
import DefaultRoom from "../pages/Detail/RoomTab/DefaultRoom";
import RoomDetail from "../pages/Detail/RoomTab/RoomDetail";
import AddRoom from "../pages/Detail/RoomTab/AddRoom";
import CurrentBooking from "../pages/notification/CurrentBooking";
import CanceledBooking from "../pages/notification/CanceledBooking";
import BookingHistory from "../pages/notification/BookingHistory";
function App() {
  return (
    <ThemeProvider theme={theme}>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<PrivateContainer />}>
            <Route path="" element={<Home />} />
            <Route path="accommodation" element={<Accommodation />}>
              <Route index element={<Navigate to="active" replace />} />
              <Route path="unfinished" element={<UnfinishedPage />} />
              <Route path="active" element={<ActivePage />} />
              <Route path="deactivated" element={<DeactivatedPage />} />
            </Route>
            <Route path="notification" element={<Notification />}>
              <Route index element={<Navigate to="current" replace />} />
              <Route path="current" element={<CurrentBooking />} />
              <Route path="canceled" element={<CanceledBooking />} />
              <Route path="history" element={<BookingHistory />} />
            </Route>
            <Route path="profile" element={<Profile />} />
          </Route>
          <Route path="newaccommodation/:id" element={<NewAccommodation />} />
          <Route path="detail/:id" element={<Detail />}>
            <Route index element={<Navigate to="info" replace />} />
            <Route path="info" element={<InfoTab />} />
            <Route path="message" element={<MessageTab />} />
            <Route path="room" element={<RoomTab />}>
              <Route index element={<DefaultRoom />} />
              <Route path=":roomId" element={<RoomDetail />} />
              <Route path="new" element={<AddRoom />} />
              <Route path="calendar/:roomId" element={<CalendarTab />} />
            </Route>
            <Route path="revenue" element={<RevenueTab />} />
          </Route>
          <Route path="login" element={<Login />} />
          <Route path="signup" element={<SignUp />} />
          <Route path="verify" element={<VerifySignup />} />
          <Route path="confirmSignup/:code" element={<ConfirmSignup />} />
          <Route path="*" element={<NotFound />} />
        </Routes>
      </BrowserRouter>
    </ThemeProvider>
  );
}

export default App;
