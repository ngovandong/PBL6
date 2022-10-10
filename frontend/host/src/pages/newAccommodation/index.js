import { useEffect, useState } from "react";
import EmptyNavBar from "../../components/EmptyNavBar";
import Footer from "../../components/Footer";
import StepLeffPanel from "./StepLeffPanel";
import StepRightPanel from "./StepRightPanel";

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

function NewAccommodation() {
  const [activeStep, setActiveStep] = useState(0);

  const handleNext = () => {
    setActiveStep((prevActiveStep) => prevActiveStep + 1);
  };

  const handleBack = () => {
    setActiveStep((prevActiveStep) => prevActiveStep - 1);
  };

  const handleDone = () => {
    setActiveStep(0);
  };
  useEffect(() =>
    {
        document.title = "Tạo chỗ ở"
    }, [])
  return (
    <div>
      <EmptyNavBar />
      <div className="full-height-container">
        <div className="full-width">
          <div className="add-new-container">
            <div className="stepper-left">
              <StepLeffPanel
                steps={steps}
                activeStep={activeStep}
                handleNext={handleNext}
                handleBack={handleBack}
                handleDone={handleDone}
              />
            </div>
            <div className="step-right">
              <StepRightPanel activeStep={activeStep} />
            </div>
          </div>
        </div>
        <Footer />
      </div>
    </div>
  );
}

export default NewAccommodation;
