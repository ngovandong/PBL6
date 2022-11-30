import Sidebar from './Sidebar';

const PrivateLayout = ({ chidrend }: any) => {
	return (
		<div className="container-fluid">
			<div className="row flex-nowrap">
				<Sidebar />
				<div className="col py-3">
					{chidrend}
					<h3>Left Sidebar with Submenus</h3>
					<p className="lead">
						An example 2-level sidebar with collasible menu items.
						The menu functions like an "accordion" where only a
						single menu is be open at a time. While the sidebar
						itself is not toggle-able, it does responsively shrink
						in width on smaller screens.
					</p>
					<ul className="list-unstyled">
						<li>
							<h5>Responsive</h5> shrinks in width, hides text
							labels and collapses to icons only on mobile
						</li>
					</ul>
				</div>
			</div>
		</div>
	);
};

export default PrivateLayout;
