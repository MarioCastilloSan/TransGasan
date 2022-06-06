import express,{Response, Request} from "express";
import { PORT } from "./config/config";
import cors from "cors";
import morgan from "morgan";
import mongoRoutes from "./routes/mongo.routes";

const app = express();

app.use(cors());
app.use(morgan("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(mongoRoutes);

app.get("/", (req: Request, res: Response) => {
  res.json({
      Name: "MongoDB API",
      author: "TransGasan Team Dev",
      description: "",
      version: "1.0.0"
  });
});

app.use((req, res, next) => {
  const error: any = new Error("Not found");
  error.status = 404;
  next(error);
});

app.use((error: any, req: any, res: any, next: any) => {
  res.status(error.status || 500);
  res.json({
    error: {
      message: error.message,
    },
  });
})


app.set("port", PORT.PORT);

export default app;
