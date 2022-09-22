// import './App.css';
import
{
  Routes,
  Route,
  BrowserRouter,
  Outlet,
} from "react-router-dom";
import Home from "../pages/home";
import Login from "../pages/login";
import SignUp from "../pages/signup";
import NotFound from "../pages/Notfound";
import PrivateRoute from "../utils/PrivateRoute";
import NavBar from "../components/NavBar";
import Accommodation from "../pages/accomodation";
import Message from "../pages/message";
import Profile from "../pages/profile";
import Footer from "../components/Footer";


function PrivateContainer()
{
  return (
    <PrivateRoute>
      <NavBar />
      <Outlet />
      <Footer />
    </PrivateRoute>
  );
}


function App()
{
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<PrivateContainer />} >
          <Route path="" element={<Home />} />
          <Route path="/accommodation" element={<Accommodation />} />
          <Route path="/message" element={<Message />} />
          <Route path="/profile" element={<Profile />} />
        </Route>
        <Route path="login" element={<Login />} />
        <Route path="signup" element={<SignUp />} />
        <Route
          path="*"
          element={
            <NotFound />
          }
        />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
