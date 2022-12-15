import * as React from "react";
import Box from "@mui/material/Box";
import TabContext from "@mui/lab/TabContext";
import TabPanel from "@mui/lab/TabPanel";
import BasicStep from "./steps/BasicStep";
import LocationStep from "./steps/LocationStep";
import Amenities from "./steps/Amenities";
import PhotosStep from "./steps/PhotosStep";
import { useSelector } from "react-redux";
import { selectActiveStep } from "../../app/store/hostSlice";

export default function StepRightPanel() {
  const activeStep = useSelector(selectActiveStep);
  return (
    <Box sx={{ width: "100%", typography: "body1" }}>
      <TabContext value={activeStep.toString()}>
        <TabPanel value="0">
          <BasicStep />
        </TabPanel>
        <TabPanel value="1">
          <LocationStep />
        </TabPanel>
        <TabPanel value="2">
          <Amenities />
        </TabPanel>
        <TabPanel value="3">
          <PhotosStep />
        </TabPanel>
      </TabContext>
    </Box>
  );
}
