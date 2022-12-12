import CheckCircleOutlineIcon from "@mui/icons-material/CheckCircleOutline";
import { Chip } from "@mui/material";
function RoomCard({name, isActive, onClick }) {
  return (
    <div
      onClick={onClick}
      className={isActive ? "room-card card-active" : "room-card"}
    >
      <Chip label="4/5" color="primary" className="filled-chip" />
      {isActive && <CheckCircleOutlineIcon className="tick-icon" />}
      {name}
    </div>
  );
}

export default RoomCard;
