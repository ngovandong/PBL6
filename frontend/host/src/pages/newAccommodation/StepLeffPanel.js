import * as React from "react";
import Box from "@mui/material/Box";
import Stepper from "@mui/material/Stepper";
import Step from "@mui/material/Step";
import StepLabel from "@mui/material/StepLabel";
import StepContent from "@mui/material/StepContent";
import Button from "@mui/material/Button";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import { useDispatch, useSelector } from "react-redux";
import {
  previousStep,
  selectActiveStep,
  updateHost,
} from "../../app/store/hostSlice";

const steps = [
  {
    label: "Thông tin cơ bản",
    description: "",
  },
  {
    label: "Vị trí",
    description: "",
  },
  {
    label: "Tiện nghi",
    description: "",
  },
  {
    label: "Ảnh",
    description: "",
  },
];

function StepLeftPanel({ isInfoTab }) {
  const activeStep = useSelector(selectActiveStep);
  const dispatch = useDispatch();
  const handleDone = () => {
    window.close();
  };
  return (
    <Box sx={{ maxWidth: 300 }}>
      <Stepper activeStep={activeStep} orientation="vertical">
        {steps.map((step, index) => (
          <Step key={step.label}>
            <StepLabel
              optional={
                index === 3 ? (
                  <Typography variant="caption">Last step</Typography>
                ) : null
              }
            >
              {step.label}
            </StepLabel>
            <StepContent>
              <Typography>{step.description}</Typography>
              <Box sx={{ mb: 2 }}>
                <div>
                  <Button
                    variant="contained"
                    onClick={() => dispatch(updateHost())}
                    sx={{ mt: 1, mr: 1 }}
                  >
                    {isInfoTab ? "Lưu" : "Tiếp theo"}
                  </Button>
                  <Button
                    disabled={index === 0}
                    onClick={() => dispatch(previousStep())}
                    sx={{ mt: 1, mr: 1 }}
                  >
                    Quay lại
                  </Button>
                </div>
              </Box>
            </StepContent>
          </Step>
        ))}
      </Stepper>
      {!isInfoTab && activeStep === steps.length && (
        <Paper square elevation={0} sx={{ p: 3 }}>
          <Typography>Tất cả các bước hoàn tất!</Typography>
          <Button onClick={handleDone} sx={{ mt: 1, mr: 1 }}>
            Đăng ký
          </Button>
        </Paper>
      )}
    </Box>
  );
}

export default StepLeftPanel;
