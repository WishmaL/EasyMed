import React from 'react';

export const Login = () => {
  return (
    <div>
      <form>
        <div className="form-group row">
          <label htmlFor="staticEmail" className="col-sm-2 col-form-label">
            Email
          </label>
          <div className="col-sm-10">
            <input
              type="text"
              readonly
              className="form-control"
              id="staticEmail"
              value="email@example.com"
            />
          </div>
        </div>
        <div className="form-group row">
          <label htmlFor="inputPassword" className="col-sm-2 col-form-label">
            Password
          </label>
          <div className="col-sm-10">
            <input
              type="password"
              className="form-control"
              id="inputPassword"
            />
          </div>
        </div>
        <div className="text-center">
          <button type="submit" className="btn btn-outline-dark ">
            Sign in
          </button>
        </div>
      </form>
    </div>
  );
};
