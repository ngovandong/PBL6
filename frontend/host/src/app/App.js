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
import NotFound from "../pages/notfound";
import PrivateRoute from "../utils/PrivateRoute";
import NavBar from "../components/NavBar";


function PrivateContainer()
{
  return (
    <PrivateRoute>
      <NavBar />
      <Outlet />
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
