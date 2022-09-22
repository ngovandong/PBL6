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

    useEffect(() =>
    {
        document.title = "Login"
    }, [])

    return (
        <div className="login-page">
            {incorrectCredentail &&
                <Alert severity="error" onClose={() => setEmail(false)}>
                    Sai email hoặc sai mật khẩu!
                </Alert>
            }
            <div className='login-container'>
                <div className="panel">
                    <div className='title-container'>
                        <h1>Đăng ký thành viên Luxstay - Tích điểm thưởng và nhận ưu đãi</h1>
                        <p>Nhanh chóng, tiện lợi và an toàn. Đăng ký liền tay, rinh ngay quyền lợi.</p>
                    </div>
                </div>
                <div className="form">
                    <form onSubmit={handle_submit}>

                        <h1>Đăng nhập</h1>

                        <label>Email</label>
                        <input className='form-input' onChange={(e) => setEmail(e.target.value)} name="email"
                            placeholder="Nhập địa chi của bạn..."
                            value={email} required /><br />

                        <label>Mật khẩu</label>
                        <input className='form-input' type="password" onChange={(e) => setPassword(e.target.value)} name="password"
                            placeholder="Nhập mật khẩu của bạn..." value={password} required /><br />

                        <input type="submit" value="Đăng nhập" />
                        <div className="bottom-text">
                            <p>Bạn chưa có tài khoản?</p>
                            <Link className="link" to='/signup'>Đăng ký</Link>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default Login;