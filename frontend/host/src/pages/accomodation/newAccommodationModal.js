import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogTitle from "@mui/material/DialogTitle";
import { useDispatch } from "react-redux";
import { createHost } from "../../app/store/hostSlice";
import { useState } from "react";

export default function NewAccommodationModal({ open, handleClose }) {
  const dispatch = useDispatch();
  const [name, setName] = useState("");
  const handleCreate = async () => {
    const resultAction = await dispatch(createHost(name));
    if (createHost.fulfilled.match(resultAction)) {
      window.open(`/newaccommodation/${resultAction.payload.id}`);
      handleClose();
    }
  };
  return (
    <Dialog open={open} onClose={handleClose}>
      <DialogTitle>New Accommodation</DialogTitle>
      <DialogContent style={{ width: "400px" }}>
        <TextField
          autoFocus
          margin="dense"
          id="name"
          label="Enter name"
          type="text"
          fullWidth
          variant="standard"
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={handleClose}>Cancel</Button>
        <Button onClick={handleCreate}>Create</Button>
      </DialogActions>
    </Dialog>
  );
}
