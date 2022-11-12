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
            <Route path="notification" element={<Notification />} />
            <Route path="profile" element={<Profile />} />
          </Route>
          <Route path="newaccommodation/:id" element={<NewAccommodation />} />
          <Route path="detail/:id" element={<Detail />} />
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
