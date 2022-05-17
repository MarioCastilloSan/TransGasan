import { getModelForClass, modelOptions, prop } from "@typegoose/typegoose";

@modelOptions({
  schemaOptions: {
    versionKey: false,
    timestamps: true,
  },
})
class Guide {
  @prop({ type: String, required: true, trim: true })
  number!: string;
  @prop({ type: String, required: false, trim: true })
  driver!: string;
  @prop({ type: String, required: true, trim: true })
  lisencePlate!: string;
  @prop({ type: String, required: false, trim: true })
  consite!: string;
  @prop({ type: String, required: true, trim: false })
  date!: String;
  @prop({ type: String, required: true, trim: true })
  inKm!: string;
  @prop({ type: String, required: true, trim: true })
  outKm!: string;
  @prop({ type: String, required: false, trim: true })
  activity!: string;
  @prop({ type: String, required: true, trim: true })
  fuel!: string;
  @prop({ type: String, required: true, trim: true })
  oilM!: string;
  @prop({ type: String, required: true, trim: true })
  graseM!: string;
  @prop({ type: String, required: true, trim: true })
  hydraulicM!: string;
  @prop({ type: String, required: false, trim: true })
  observations!: string;
}

const GuideModel = getModelForClass(Guide);
export default GuideModel;
