import * as Yup from "yup";

const addAttorneySchema = Yup.object().shape({
  practiceName: Yup.string().min(1).max(255, "Max Character Limit").nullable(true),
  locationTypeId: Yup.number().min(1,"Must Select Location Type").required("Is Required"),
  lineOne: Yup.string().max(255).required("Is Required"),
  lineTwo: Yup.string().max(255),
  city: Yup.string().max(255).required("Is Required"),
  zip: Yup.string().max(50).required("Is Required"),
  stateId: Yup.number().min(1,"Must Select State").required("Is Required"),
  latitude: Yup.number(),
  longitude: Yup.number(),
  bio: Yup.string().max(4000, "Max Character Limit").nullable(true),
  phone: Yup.string().max(20, "Max Character Limit").nullable(true),
  email: Yup.string().max(255, "Max Character Limit").nullable(true),
  website: Yup.string().max(255, "Max Character Limit").nullable(true),
  languages: Yup.array(),
});

export {addAttorneySchema};
