import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
  Fab,
} from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import VisibilityIcon from "@mui/icons-material/Visibility";
import DeleteIcon from "@mui/icons-material/Delete";
import StopIcon from "@mui/icons-material/Stop";
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import CalendarMonthIcon from "@mui/icons-material/CalendarMonth";
function ToolBar({ choosedRoom }) {
  const navigate = useNavigate();
  const isSingle = Object.values(choosedRoom).filter((v) => v).length === 1;
  const isChoosed = Object.values(choosedRoom).filter((v) => v).length > 0;

  const [openStopDialog, setOpenStopDialog] = useState(false);
  const [openDeleteDialog, setOpenDeleteDialog] = useState(false);
  const handleView = () => {
    for (const key in choosedRoom) {
      if (choosedRoom[key]) {
        navigate(key);
      }
    }
  };
  const handleCalendar = () => {
    for (const key in choosedRoom) {
      if (choosedRoom[key]) {
        navigate(`calendar/${key}`);
      }
    }
  };

  return (
    <div className="tool-bar">
      <Dialog
        open={openStopDialog}
        onClose={() => {
          setOpenStopDialog(false);
        }}
      >
        <DialogTitle id="alert-dialog-title">
          Xác nhận ngừng hoạt động
        </DialogTitle>
        <DialogContent>
          <DialogContentText id="alert-dialog-description">
            Sau khi ngừng hoạt động thì phòng sẽ không con đặt được!
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button
            onClick={() => {
              setOpenStopDialog(false);
            }}
          >
            Cancel
          </Button>
          <Button
            onClick={() => {
              setOpenStopDialog(false);
            }}
            autoFocus
          >
            Agree
          </Button>
        </DialogActions>
      </Dialog>
      <Dialog
        open={openDeleteDialog}
        onClose={() => {
          setOpenDeleteDialog(false);
        }}
      >
        <DialogTitle id="alert-dialog-title">Xác nhận xóa</DialogTitle>
        <DialogContent>
          <DialogContentText id="alert-dialog-description">
            Bạn có muốn xóa các phòng đã chọn?
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button
            onClick={() => {
              setOpenDeleteDialog(false);
            }}
          >
            Cancel
          </Button>
          <Button
            onClick={() => {
              setOpenDeleteDialog(false);
            }}
            autoFocus
          >
            Agree
          </Button>
        </DialogActions>
      </Dialog>
      <Fab onClick={() => navigate("new")} color="primary" aria-label="add">
        <AddIcon />
      </Fab>
      <Fab onClick={handleView} disabled={!isSingle} aria-label="edit">
        <VisibilityIcon />
      </Fab>
      <Fab onClick={() => setOpenDeleteDialog(true)} disabled={!isChoosed}>
        <DeleteIcon />
      </Fab>
      <Fab onClick={handleCalendar} disabled={!isSingle}>
        <CalendarMonthIcon />
      </Fab>
      <Fab
        onClick={() => setOpenStopDialog(true)}
        disabled={!isChoosed}
        variant="extended"
      >
        <StopIcon sx={{ mr: 1 }} />
        Ngừng hoạt động
      </Fab>
    </div>
  );
}

export default ToolBar;
