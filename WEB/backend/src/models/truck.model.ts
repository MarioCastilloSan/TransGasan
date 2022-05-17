import { getModelForClass, modelOptions, prop } from "@typegoose/typegoose";


@modelOptions({
  schemaOptions: {
    versionKey: false,
    timestamps: true,
  },
})
class Truck {
  @prop({ type: String, required: true, trim: true })
  lisencePlate!: string;
  @prop({ type: String, required: true, trim: true })
  conSiteId!: string;
  @prop({ type: String, required: true, trim: true })
  fuel!: string;
  @prop({ type: String, required: true, trim: true })
  cubedC!: string;
  @prop({ type: String, required: true, trim: true })
  driverId!: string;
}

const TruckModel = getModelForClass(Truck);
export default TruckModel;
