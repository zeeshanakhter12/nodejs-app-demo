import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
  return (
    <div>
      That's some random page somewhere, Go back!
      <Link to="/">Go back home</Link>
    </div>
  );
};
