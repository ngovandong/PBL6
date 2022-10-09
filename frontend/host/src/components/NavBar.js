import React, { useState, useEffect } from "react";
import AppBar from "@mui/material/AppBar";
import Box from "@mui/material/Box";
import Toolbar from "@mui/material/Toolbar";
import IconButton from "@mui/material/IconButton";
import Typography from "@mui/material/Typography";
import Menu from "@mui/material/Menu";
import MenuIcon from "@mui/icons-material/Menu";
import Container from "@mui/material/Container";
import Avatar from "@mui/material/Avatar";
import Tooltip from "@mui/material/Tooltip";
import MenuItem from "@mui/material/MenuItem";
import Divider from "@mui/material/Divider";
import FlightTakeoffIcon from "@mui/icons-material/FlightTakeoff";
import { useDispatch } from "react-redux";
import { logout } from "../app/store/authSlice";
import { NavLink, useNavigate } from "react-router-dom";
const links = [
  { link: "", name: "Tổng quan" },
  { link: "accommodation", name: "Chỗ ở" },
  { link: "message", name: "Tin Nhắn" },
  { link: "profile", name: "Hồ sơ" },
];
const NavBar = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const [anchorElNav, setAnchorElNav] = useState(null);
  const [anchorElUser, setAnchorElUser] = useState(null);
  const [anchorElLanguage, setAnchorElLanguage] = useState(null);
  const [lan, setLan] = useState("vn");
  const handleOpenNavMenu = (event) => {
    setAnchorElNav(event.currentTarget);
  };
  const handleOpenUserMenu = (event) => {
    setAnchorElUser(event.currentTarget);
  };
  const handleOpenLanguage = (event) => {
    setAnchorElLanguage(event.currentTarget);
  };

  const handleCloseNavMenu = () => {
    setAnchorElNav(null);
  };

  const handleCloseUserMenu = () => {
    setAnchorElUser(null);
  };

  const handleLogout = () => {
    dispatch(logout());
  };

  return (
    <AppBar position="static">
      <Container maxWidth="xl">
        <Toolbar disableGutters>
          <FlightTakeoffIcon
            sx={{ display: { xs: "none", md: "flex" }, mr: 1 }}
          />
          <Typography
            variant="h6"
            noWrap
            component="a"
            href="/"
            sx={{
              mr: 2,
              display: { xs: "none", md: "flex" },
              fontFamily: "monospace",
              fontWeight: 700,
              letterSpacing: ".3rem",
              color: "inherit",
              textDecoration: "none",
            }}
          >
            ReadyBooking
          </Typography>

          <Box sx={{ flexGrow: 1, display: { xs: "flex", md: "none" } }}>
            <IconButton
              size="large"
              aria-label="account of current user"
              aria-controls="menu-appbar"
              aria-haspopup="true"
              onClick={handleOpenNavMenu}
              color="inherit"
            >
              <MenuIcon />
            </IconButton>
            <Menu
              id="menu-appbar"
              anchorEl={anchorElNav}
              anchorOrigin={{
                vertical: "bottom",
                horizontal: "left",
              }}
              keepMounted
              transformOrigin={{
                vertical: "top",
                horizontal: "left",
              }}
              open={Boolean(anchorElNav)}
              onClose={handleCloseNavMenu}
              sx={{
                display: { xs: "block", md: "none" },
              }}
            >
              {links.map((link) => (
                <MenuItem key={link.link} onClick={handleCloseNavMenu}>
                  <NavLink className="nav-button" to={link.link}>
                    {link.name}
                  </NavLink>
                </MenuItem>
              ))}
            </Menu>
          </Box>
          <FlightTakeoffIcon
            sx={{ display: { xs: "flex", md: "none" }, mr: 1 }}
          />
          <Typography
            variant="h5"
            noWrap
            component="a"
            href=""
            sx={{
              mr: 2,
              display: { xs: "flex", md: "none" },
              flexGrow: 1,
              fontFamily: "monospace",
              fontWeight: 700,
              letterSpacing: ".3rem",
              color: "inherit",
              textDecoration: "none",
            }}
          >
            ReadyBooking
          </Typography>
          <Box sx={{ flexGrow: 1, display: { xs: "none", md: "flex" } }}>
            {links.map((link) => (
              <NavLink
                key={link.link}
                className={({ isActive }) =>
                  isActive ? "nav-item nav-item--active " : "nav-item"
                }
                to={link.link}
              >
                {link.name}
              </NavLink>
            ))}
          </Box>
          <Box sx={{ flexGrow: 0 }}>
            <Tooltip title="Language">
              <IconButton onClick={handleOpenLanguage} sx={{ p: 2 }}>
                <span className={`fi fi-${lan}`}></span>
              </IconButton>
            </Tooltip>
            <Menu
              anchorEl={anchorElLanguage}
              id="language-menu"
              open={Boolean(anchorElLanguage)}
              onClose={() => setAnchorElLanguage(null)}
              onClick={() => setAnchorElLanguage(null)}
              sx={{ mt: "45px" }}
              anchorOrigin={{
                vertical: "top",
                horizontal: "right",
              }}
              keepMounted
              transformOrigin={{
                vertical: "top",
                horizontal: "right",
              }}
            >
              <MenuItem onClick={() => setLan("vn")}>
                <span
                  style={{ marginRight: "6px" }}
                  className="fi fi-vn"
                ></span>{" "}
                Viet Nam
              </MenuItem>
              <MenuItem onClick={() => setLan("us")}>
                <span
                  style={{ marginRight: "6px" }}
                  className="fi fi-us"
                ></span>{" "}
                US
              </MenuItem>
            </Menu>
          </Box>
          <Divider
            orientation="vertical"
            style={{
              backgroundColor: "white",
              width: "2px",
              height: "45px",
              marginRight: "16px",
            }}
          />
          <Box sx={{ flexGrow: 0 }}>
            <Tooltip title="Open settings">
              <IconButton onClick={handleOpenUserMenu} sx={{ p: 0 }}>
                <Avatar alt="Remy Sharp" src="/static/images/avatar/2.jpg" />
              </IconButton>
            </Tooltip>
            <Menu
              sx={{ mt: "45px" }}
              id="menu-appbar"
              anchorEl={anchorElUser}
              anchorOrigin={{
                vertical: "top",
                horizontal: "right",
              }}
              keepMounted
              transformOrigin={{
                vertical: "top",
                horizontal: "right",
              }}
              open={Boolean(anchorElUser)}
              onClose={handleCloseUserMenu}
            >
              <MenuItem onClick={handleCloseUserMenu}>
                <Typography textAlign="center">Hồ sơ</Typography>
              </MenuItem>
              <MenuItem onClick={handleLogout}>
                <Typography textAlign="center">Đăng xuất</Typography>
              </MenuItem>
            </Menu>
          </Box>
        </Toolbar>
      </Container>
    </AppBar>
  );
};
export default NavBar;
