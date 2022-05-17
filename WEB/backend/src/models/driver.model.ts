import { getModelForClass, modelOptions, prop } from "@typegoose/typegoose";

@modelOptions({
  schemaOptions: {
    versionKey: false,
    timestamps: true,
  },
})


class Driver {
  @prop({ type: String, required: true, trim: true })
  name!: string;

}

const DriverModel = getModelForClass(Driver);
export default DriverModel;
