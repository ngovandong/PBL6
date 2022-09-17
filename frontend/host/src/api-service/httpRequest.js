import axios from 'axios';
import store from '../app/store'
import { setToken, logout } from '../app/store/authSlice';

const getCurrentToken = () =>
{
    return store.getState().auth.token;
}
const appendHeader = (request) =>
{
    const token = getCurrentToken()
    if (token) {
        const { access } = token;
        request.headers["Authorization"] = `Bearer ${access}`;
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

let refresh = false

const refreshToken = async (error) =>
{
    const token = getCurrentToken()
    if (error.response?.status === 401 && !refresh && token) {
        refresh = true;
        try {
            const { _, data } = await axios.post('api/token/refresh/', { refresh: token.refresh });
            store.dispatch(setToken(data))
            console.log(error.config.headers["Authorization"] = `Bearer ${data.access}`)
            return axios(error.config);
        } catch {
            store.dispatch(logout())
        }
    }
    refresh = false;
    return error;
}



axios.defaults.baseURL = process.env.REACT_APP_BASE_URL

const request = axios.create();


request.interceptors.request.use(
    appendHeader
)
request.interceptors.request.use(
    appendSlash
)

request.interceptors.response.use(
    res => res, refreshToken
)

export { request }