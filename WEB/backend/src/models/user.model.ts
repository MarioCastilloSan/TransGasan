import {
  DocumentType,
  getModelForClass,
  index,
  modelOptions,
  pre,
  prop,
} from '@typegoose/typegoose';
import bcrypt from 'bcryptjs';

@index({ username: 1 })
@pre<User>('save', async function () {
  // Hash password if the password is new or was updated
  if (!this.isModified('password')) return;

  // Hash password with costFactor of 12
  this.password = await bcrypt.hash(this.password, 12);
})

@modelOptions({
  schemaOptions: {
    versionKey: false,
    timestamps: true,
  },
})


class User {
  @prop({ unique: true, required: true })
  username!: string;
  @prop({ required: true, minlength: 5, maxLength: 32 })
  password!: string;
  @prop({ })
  idType!: object;
  @prop({  })
  idProfile!: object;
  // Instance method to check if passwords match
  async comparePasswords(hashedPassword: string, candidatePassword: string) {
    return await bcrypt.compare(candidatePassword, hashedPassword);
  }
}


const userModel = getModelForClass(User);

export default userModel;


