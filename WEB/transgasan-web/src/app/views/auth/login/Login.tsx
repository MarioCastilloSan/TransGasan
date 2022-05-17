import { AuthCard } from "../components/authCard/AuthCard";
import logo from "../../../assets/img/logo.png";
import React, { useContext, useEffect, useReducer } from "react";
import { useNavigate  } from "react-router-dom";
import { AuthContext } from "../../store/contexts/AuthContext";
import { AuthService } from "../../../services/auth/AuthService";
import {
  Button,
  CardActions,
  CardContent,
  Checkbox,
  FormControlLabel,
  InputAdornment,
  TextField,
} from "@mui/material";
import AccountCircle from "@mui/icons-material/AccountCircle";
import LockIcon from "@mui/icons-material/Lock";

type State = {
  username: string;
  password: string;
  checkbox: boolean;
  isButtonDisabled: boolean;
  helperText: string;
  isError: boolean;
};

const initialState: State = {
  username: "",
  password: "",
  checkbox: false,
  isButtonDisabled: true,
  helperText: "",
  isError: false,
};

type Action =
  | { type: "setUsername"; payload: string }
  | { type: "setPassword"; payload: string }
  | { type: "setCheckbox"; payload: boolean }
  | { type: "setIsButtonDisabled"; payload: boolean }
  | { type: "loginSuccess"; payload: string }
  | { type: "loginFailed"; payload: string }
  | { type: "setIsError"; payload: boolean };

const reducer = (state: State, action: Action): State => {
  switch (action.type) {
    case "setUsername":
      return {
        ...state,
        username: action.payload,
      };
    case "setPassword":
      return {
        ...state,
        password: action.payload,
      };
    case "setCheckbox":
      return {
        ...state,
        checkbox: action.payload,
      };
    case "setIsButtonDisabled":
      return {
        ...state,
        isButtonDisabled: action.payload,
      };
    case "loginSuccess":
      return {
        ...state,
        helperText: action.payload,
        isError: false,
      };
    case "loginFailed":
      return {
        ...state,
        helperText: action.payload,
        isError: true,
      };
    case "setIsError":
      return {
        ...state,
        isError: action.payload,
      };
  }
};

export function Login() {
  const { dispatchUser }: any = useContext(AuthContext);
  const navigate = useNavigate();
  const [state, dispatch] = useReducer(reducer, initialState);

  useEffect(() => {
    if (state.username.trim() && state.password.trim()) {
      dispatch({
        type: "setIsButtonDisabled",
        payload: false,
      });
    } else {
      dispatch({
        type: "setIsButtonDisabled",
        payload: true,
      });
    }
  }, [state.username, state.password]);

  //Provisorio hasta tener la BD para verificar el admin
  const handleLogin = async () => {
    try {
      console.log(state);
      const resp = await AuthService.login(state);
      console.log(resp);
      //if(resp.success)
      if (state.username === "admin" && state.password === "admin") {
        dispatch({
          type: "loginSuccess",
          payload: "Login Successfully",
        });
        sessionStorage.setItem(
          "user",
          JSON.stringify({ ...resp.data, loggedIn: true })
        );
        dispatchUser({ type: "login", payload: resp.data });
        navigate("/dashboard/home");
      } else {
        dispatch({
          type: "loginFailed",
          payload: "Incorrect username or password",
        });
      }
    } catch (error) {}
  };

  const handleKeyPress = (event: React.KeyboardEvent) => {
    if (event.keyCode === 13 || event.which === 13) {
      state.isButtonDisabled || handleLogin();
    }
  };

  const handleUsernameChange: React.ChangeEventHandler<HTMLInputElement> = (
    event
  ) => {
    dispatch({
      type: "setUsername",
      payload: event.target.value,
    });
  };

  const handlePasswordChange: React.ChangeEventHandler<HTMLInputElement> = (
    event
  ) => {
    dispatch({
      type: "setPassword",
      payload: event.target.value,
    });
  };

  const handleCheckboxChange: React.ChangeEventHandler<HTMLInputElement> = (
    event
  ) => {
    dispatch({
      type: "setCheckbox",
      payload: event.target.checked,
    });
  };

  return (
    <AuthCard>
      <form autoComplete="off">
        <div className="text-center mb-2">
          <img className="img-fluid" src={logo} alt="logo" />
        </div>
        <CardContent>
          <TextField
            error={state.isError}
            fullWidth
            id="username"
            type="username"
            label="Username"
            placeholder="Username"
            InputProps={{
              startAdornment: (
                <InputAdornment position="start">
                  <AccountCircle />
                </InputAdornment>
              ),
            }}
            margin="normal"
            onChange={handleUsernameChange}
            onKeyPress={handleKeyPress}
          />
          <TextField
            error={state.isError}
            fullWidth
            id="password"
            type="password"
            label="Password"
            placeholder="Password"
            InputProps={{
              startAdornment: (
                <InputAdornment position="start">
                  <LockIcon />
                </InputAdornment>
              ),
            }}
            margin="normal"
            helperText={state.helperText}
            onChange={handlePasswordChange}
            onKeyPress={handleKeyPress}
          />
          <FormControlLabel
            control={
              <Checkbox
                id="checkbox"
                inputProps={{ "aria-label": "Remember me" }}
                onChange={handleCheckboxChange}
              />
            }
            label="Remember me"
          />
        </CardContent>
        <CardActions>
          <Button
            variant="contained"
            size="medium"
            color="secondary"
            onClick={handleLogin}
            disabled={state.isButtonDisabled}
          >
            Login
          </Button>
        </CardActions>
      </form>
    </AuthCard>
  );
}
