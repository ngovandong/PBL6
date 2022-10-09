import { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom';
import Alert from '@mui/material/Alert';
import { MuiTelInput } from 'mui-tel-input'

function SignUp()
{
    const [value, setValue] = useState('+84')

    const handleChange = (newValue) =>
    {
        setValue(newValue)
        console.log(newValue)
    }
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [signupSubmitted, setSignupSubmitted] = useState(false);
    const [incorrectCredentail, setIncorrectCredentail] = useState(false);
    const navigate = useNavigate()

    useEffect(() =>
    {
        document.title = "Sign up"
    }, [])

    const handle_submit = async (e) =>
    {
        e.preventDefault();
        navigate("/login")
        // // Log the user in through a redux action
        // const response = await props.login(state.email, state.password)

        // // Check if credentials are correct
        // if (response === "Incorrect Credentials") {
        //     setState({ ...state, incorrect_credentials: true, email: '', password: '' })
        // } else {
        //     // Set login_submitted to true so that we redirect to home page
        //     setState({ ...state, login_submitted: true })
        // }
    }
    return (
        <div className="login-page" >
            {incorrectCredentail &&
                <Alert severity="error" onClose={() => setEmail(false)}>
                    Email or password is incorrect!
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

                        <h1>Đăng ký</h1>

                        <label>Tên</label>
                        <input className='form-input' type="text" onChange={(e) => setFirstName(e.target.value)} name="first_name"
                            placeholder="Nhập tên..." value={firstName} required /><br />

                        <label>Họ</label>
                        <input className='form-input' type="text" onChange={(e) => setLastName(e.target.value)} name="last_name"
                            placeholder="Nhập họ..." value={lastName} required /><br />

                        <label>Email</label>
                        <input className='form-input' type="email" onChange={(e) => setEmail(e.target.value)} name="email"
                            placeholder="Nhập địa chỉ email..."
                            value={email} required /><br />
                        <label>Số điện thoại</label>
                        <br />
                        <MuiTelInput style={{ border: " 0px" }} value={value} onChange={handleChange} />
                        <br />

                        <label>Mật khẩu</label>
                        <input className='form-input' type="password" onChange={(e) => setPassword(e.target.value)} name="password"
                            placeholder="Nhập mật khẩu..." value={password} required /><br />

                        <label>Xác nhận mật khẩu</label>
                        <input className='form-input' type="password" onChange={(e) => setConfirmPassword(e.target.value)} name="confirm_password"
                            placeholder="Xác nhận mật khẩu..." value={confirmPassword} required /><br />

                        <input type="submit" value="Đăng ký" />

                        <div className="bottom-text">
                            <p>Bạn đã có tài khỏan?</p>
                            <Link className="link" to='/login'>Đăng nhập</Link>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default SignUp;