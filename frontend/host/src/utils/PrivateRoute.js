import React from 'react';
import { Navigate } from 'react-router-dom';
import { useSelector } from 'react-redux';

import history from './history';
import { selectToken } from '../app/store/authSlice';

function PrivateRoute({ children })
{
    const token = useSelector(selectToken)

    if (!token)
        return (<Navigate to="/login" state={{ from: history.location }} />);
    return children
}

export default PrivateRoute;

