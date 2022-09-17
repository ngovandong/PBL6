import { useState, useEffect } from 'react'
import { Link, useNavigate } from 'react-router-dom';
import Alert from '@mui/material/Alert';
import { useDispatch, useSelector } from 'react-redux';
import { login, selectToken } from '../../app/store/authSlice';
function Login()
{
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [incorrectCredentail, setIncorrectCredentail] = useState(false);
    const navigate = useNavigate()
    const dispatch = useDispatch()
    const token = useSelector(selectToken);
    const handle_submit = async (e) =>
    {
        e.preventDefault();
        dispatch(login({ username: email, password }))
    }


    useEffect(() =>
    {
        if (token) {
            navigate("/")
        }
    }, [token]);

    return (
        <div className="login-page">
            {incorrectCredentail &&
                <Alert severity="error" onClose={() => setEmail(false)}>
                    Email or password is incorrect!
                </Alert>
            }
            <div className="form">
                <form onSubmit={handle_submit}>

                    <h1>Log in</h1>

                    <label>Email</label>
                    <input onChange={(e) => setEmail(e.target.value)} name="email"
                        placeholder="Enter your email address..."
                        value={email} required /><br />

                    <label>Password</label>
                    <input type="password" onChange={(e) => setPassword(e.target.value)} name="password"
                        placeholder="Enter your password..." value={password} required /><br />

                    <input type="submit" value="Log in" />
                    <div className="bottom-text">
                        <p>Don't have an account?</p>
                        <Link className="link" to='/signup'>Sign up</Link>
                    </div>
                </form>
            </div>
        </div>
    );
}

export default Login;