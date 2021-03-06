import Sequelize from "sequelize";
import User from "../app/models/User";
import Auditoria from "../app/models/Auditoria";
import Plan from '../app/models/Plan';
import File from '../app/models/File';
import Question from '../app/models/Question';
import Setor from '../app/models/Setor';;
import databaseConfig from "../config/database";

const models = [User,Auditoria,Plan,File,Question,Setor];

class Database {
  constructor() {
    this.init();
  }

  init() {
    this.connection = new Sequelize(databaseConfig);
    models
      .map(model => model.init(this.connection))
      .map(model => model.associate && model.associate(this.connection.models));
  }
}
export default new Database();
