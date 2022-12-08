import axios from 'axios';
import store from '../app/store'
// import { setAccount, logout } from '../app/store/authSlice';

const getCurrentAccount = () =>
{
    return store.getState().auth.account;
}
const appendHeader = (request) =>
{
    const account = getCurrentAccount()
    if (account) {
        const { accessToken } = account;
        request.headers["Authorization"] = `Bearer ${accessToken}`;
    }
    return request
}

const appendSlash = (request) =>
{
    if (!request.url.endsWith('/')) {
        request.url += '/'
    }
    return request;
}

// let refresh = false

// const refreshToken = async (error) =>
// {
//     const account = getCurrentAccount()
//     if (error.response?.status === 401 && !refresh && account) {
//         refresh = true;
//         try {
//             const { _, data } = await axios.post('api/token/refresh/', { refresh: account.refresh });
//             store.dispatch(setToken(data))
//             console.log(error.config.headers["Authorization"] = `Bearer ${data.access}`)
//             return axios(error.config);
//         } catch {
//             store.dispatch(logout())
//         }
//     }
//     refresh = false;
//     return error;
// }



axios.defaults.baseURL = process.env.REACT_APP_BASE_URL

const request = axios.create();


request.interceptors.request.use(
    appendHeader
)
request.interceptors.request.use(
    appendSlash
)

// request.interceptors.response.use(
//     res => res, refreshToken
// )

export { request }