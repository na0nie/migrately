import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Card, Col, Row } from "react-bootstrap";
import Loki from "react-loki";
import {
  BsFillPersonFill,
  BsGeoAltFill,
  BsInfoCircleFill,
  BsTelephoneFill,
  BsChatQuoteFill,
  BsFillCheckSquareFill,
} from "react-icons/bs";
import PracticeName from "./PracticeName";
import AttorneyLocation from "./AttorneyLocation";
import AttorneyBio from "./AttorneyBio";
import AttorneyContact from "./AttorneyContact";
import AttorneyLanguage from "./AttorneyLanguage";
import PreviewData from "./PreviewData";
import attorneyService from "services/attorneyService";
import toastr from "toastr";
import Swal from "sweetalert2";
import "./attorney.css";
import debug from "sabio-debug";

const _logger = debug.extend("AttorneyForm");

function AttorneyForm() {
  const [attorneyInfo, setAttorneyInfo] = useState({
    practiceName: null,
    locationTypeId: 0,
    lineOne: "",
    lineTwo: "",
    city: "",
    zip: "",
    stateId: 0,
    latitude: "",
    longitude: "",
    createdBy: 0,
    modifiedBy: 0,
    bio: null,
    phone: null,
    email: null,
    website: null,
    languages: [],
  });
  const [locationTypes, setLocationTypes] = useState([]);
  const [states, setStates] = useState([]);

  const navigate = useNavigate();

  const getFormData = (values) => {
    _logger("getFormDataValues", values);
    var languageNames = attorneyInfo.languages.map((lang) => lang.name);
    _logger("languages", languageNames);
    return {
      practiceName: attorneyInfo.practiceName,
      locationTypeId: attorneyInfo.locationTypeId,
      lineOne: attorneyInfo.lineOne,
      lineTwo: attorneyInfo.lineTwo,
      city: attorneyInfo.city,
      zip: attorneyInfo.zip,
      stateId: attorneyInfo.stateId,
      latitude: attorneyInfo.latitude,
      longitude: attorneyInfo.longitude,
      bio: attorneyInfo.bio,
      phone: attorneyInfo.phone,
      email: attorneyInfo.email,
      website: attorneyInfo.website,
      languages: languageNames,
    };
  };

  const onSubmit = (values) => {
    let payload = getFormData(values);
    _logger("payload", payload);
    attorneyService
      .addAttorney(payload)
      .then(onAddAttorneySuccess)
      .catch(onAddAttorneyError);
  };

  const onAddAttorneySuccess = () => {
    Swal.fire(
      "Attorney Profile Created!",
      "Please wait to be redirected.",
      "success",
      {
        button: "Ok",
      }
    ).then(navigate("/attorney/dashboard"));
  };

  const onAddAttorneyError = () => {
    toastr.error("Error");
  };

  const formSteps = [
    {
      label: "Step 1",
      component: <PracticeName attorneyInfo={attorneyInfo} />,
      icon: <BsFillPersonFill />,
    },
    {
      label: "Step 2",
      component: (
        <AttorneyLocation
          attorneyInfo={attorneyInfo}
          setAttorneyInfo={setAttorneyInfo}
          locationTypes={locationTypes}
          setLocationTypes={setLocationTypes}
          states={states}
          setStates={setStates}
        />
      ),
      icon: <BsGeoAltFill />,
    },
    {
      label: "Step 3",
      component: <AttorneyBio attorneyInfo={attorneyInfo} />,
      icon: <BsInfoCircleFill />,
    },
    {
      label: "Step 4",
      component: <AttorneyContact attorneyInfo={attorneyInfo} />,
      icon: <BsTelephoneFill />,
    },
    {
      label: "Step 5",
      component: <AttorneyLanguage attorneyInfo={attorneyInfo} />,
      icon: <BsChatQuoteFill />,
    },
    {
      label: "Step 6",
      component: (
        <PreviewData
          attorneyInfo={attorneyInfo}
          locationTypes={locationTypes}
          states={states}
          onFinish={onSubmit}
        />
      ),
      icon: <BsFillCheckSquareFill />,
    },
  ];

  const mergeValues = (values) => {
    _logger("mergeValues", values);
    setAttorneyInfo((prevState) => {
      return { ...prevState, ...values };
    });
    _logger("attorneyInfo", attorneyInfo);
  };

  return (
    <Card className="border-0">
      <Card.Header>
        <div className="mb-3 mb-lg-0">
          <h2 className="mb-0 fw-bold">Add Attorney</h2>
        </div>
      </Card.Header>
      <Card.Body>
        <Row className="mb-5">
          <Col lg={8} md={10} sm={12}>
            <Loki
              steps={formSteps}
              onNext={mergeValues}
              onBack={mergeValues}
              onFinish={onSubmit}
              backLabel={"Back"}
              nextLabel={"Next"}
              noActions
            ></Loki>
          </Col>
        </Row>
      </Card.Body>
    </Card>
  );
}

export default AttorneyForm;

