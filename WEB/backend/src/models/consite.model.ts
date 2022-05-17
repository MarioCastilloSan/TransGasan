import { getModelForClass, modelOptions, prop } from "@typegoose/typegoose";

@modelOptions({
  schemaOptions: {
    versionKey: false,
    timestamps: true,
  },
})


class Consite {
  @prop({ type: String, required: true, trim: true })
  name!: string;
  
  @prop({ type: String, required: false, trim: true })
  guides!: string;

  @prop({ type: String, required: true, trim: true })
  m3!: string;

  @prop({ type: String, required: true, trim: true })
  KmCube!: string;

  @prop({ type: String, required: true, trim: true })
  start!: string;

  @prop({ type: String, trim: true })
  destinity!: string;

  @prop({ type: String, required: true, trim: true })
  tLaps!: string;

}

const ConsiteModel = getModelForClass(Consite);
export default ConsiteModel;
