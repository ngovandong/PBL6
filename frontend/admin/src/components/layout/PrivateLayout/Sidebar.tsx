import { SIDE_BAR } from '@/constants';

const Sidebar = () => {
	return (
		<div className="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-light">
			<div className="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
				<a
					href="/"
					className="d-flex align-items-center py-3 mb-md-0 mx-auto me-md-auto text-decoration-none">
					<span className="fs-5 d-none d-sm-inline">
						Ready booking
					</span>
				</a>
				<ul
					className="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
					id="menu">
					{SIDE_BAR.map((item) => (
						<li className="nav-item" key={item.name}>
							<a
								href={item.path}
								className="nav-link align-middle px-0">
								<i className={item.icon || ''}></i>
								<span className="ms-2 d-none d-sm-inline">
									{item.name}
								</span>
							</a>
						</li>
					))}
				</ul>
				<br />
				<div className="dropdown pb-4">
					<a
						href="/#"
						className="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
						id="dropdownUser1"
						data-bs-toggle="dropdown"
						aria-expanded="false">
						<img
							src="https://github.com/mdo.png"
							alt="hugenerd"
							width="30"
							height="30"
							className="rounded-circle"
						/>
						<span className="d-none d-sm-inline mx-1">loser</span>
					</a>
					<ul
						className="dropdown-menu dropdown-menu-dark text-small shadow"
						aria-labelledby="dropdownUser1">
						<li>
							<a className="dropdown-item" href="/#">
								Quản lý tài khoản
							</a>
						</li>
						<li>
							<a className="dropdown-item" href="/#">
								Đăng xuât
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	);
};

export default Sidebar;
