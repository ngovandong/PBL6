import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { getUser, selectUser } from "../../app/store/authSlice";

function Home()
{
    const dispatch = useDispatch()
    const user = useSelector(selectUser);

    useEffect(() =>
    {
        if (!user)
            dispatch(getUser());
    }, []);
    return (
        <div>
            {user && <div>{user.username}</div>}
        </div>

    );
}

export default Home;