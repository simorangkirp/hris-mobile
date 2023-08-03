const String baseUrl = 'http://182.23.67.40:8083/officeapi/';

class Routes {
  static const root = '/';
  static const splashPage = '/splash';
  static const splashNamedPage = 'splash';
  static const loginNamedPage = '/login';
  static const loginDetailsNamedPage = 'login';
  static const homeNamedPage = '/home';
  static const homeDetailsNamedPage = 'home';
  static const activityNamedPage = '/activity';
  static const activityDetailsNamedPage = 'activity';
  static const notificationNamedPage = '/notification';
  static const notificationDetailsNamedPage = 'notification';
  static const profileNamedPage = '/profile';
  static const profileDetailsNamedPage = 'profile'; //* Profile sub-routes
  //* Profile components
  static const infoPersonalPage = ':menu/:id';
  static const infoPersonalNamedPage = 'infoPersonal';
  static const infoPersonalLvl1Page = ':lvl1';
  static const infoPersonalLvl1NamedPage = 'infoPersonalLvl1';
  static const infoPersonalLvl2Page = ':lvl2';
  static const infoPersonalLvl2NamedPage = 'infoPersonalLvl2';
  static const infoPersonalLvl3Page = ':lvl3';
  static const infoPersonalLvl3NamedPage = 'infoPersonalLvl3';
  // static const infoPekerjaanNamedPage = 'infoPekerjaan';
  // static const infoKontakNamedPage = 'infoKontak';
  // static const infoKeluargaNamedPage = 'infoKeluarga';
  // static const pendidikanPengalamanNamedPage = 'pendidikanPengalaman';
  // static const infoPayrollNamedPage = 'infoPayroll';

  //* Inbox sub-routes
  static const inboxPage = ':menu';
  static const inboxNamedPage = 'inboxPage';

  //* Home sub-routes
  static const homeMenusPage = ':menu';
  static const homeMenuslNamed = 'homeSubmenus';
  //! Home Sub-menus
  static const topmenuAbsen = 'topmenu.absen';
  static const topmenuPjd = 'topmenu.pjd';
  static const topmenuCuti = 'topmenu.cuti';
  static const iconmenuReimbursment = 'iconmenu.reimbursment';
  static const iconmenuDaftarAbsen = 'iconmenu.daftarAbsen';
  static const iconmenuKalender = 'iconmenu.kalender';
  static const iconmenuCuti = 'iconmenu.cuti';
  static const iconmenuAbsen = 'iconmenu.absen';
  static const iconmenuFormulir = 'iconmenu.formulir';
  static const iconmenuPjd = 'iconmenu.pjd';

  static const subLevel1Page = ':sublevel1/:mode';
  static const subLevel1lNamed = 'level1Submenus';
  static const subLevel2Page = ':sublevel2';
  static const subLevel2Named = 'level2Submenus';
  // static const infoPekerjaanNamedPage = 'infoPekerjaan';
  // static const infoKontakNamedPage = 'infoKontak';
  // static const infoKeluargaNamedPage = 'infoKeluarga';
  // static const pendidikanPengalamanNamedPage = 'pendidikanPengalaman';
  // static const infoPayrollNamedPage = 'infoPayroll';

  // static const settingsNamedPage = '/settings';
  //static profileNamedPage([String? name]) => '/${name ?? ':profile'}';
}
