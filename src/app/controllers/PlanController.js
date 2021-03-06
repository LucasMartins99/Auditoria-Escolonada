import * as Yup from "yup";

import Plan from '../models/Plan';
import File from '../models/File';
import Auditoria from '../models/Auditoria';
import User from '../models/User';
import Mail from '../../lib/Mail';
import Question from '../models/Question';

class ListController {
  async store(req, res) {
    const schema = Yup.object().shape({
      item: Yup.string().required(),
      problema: Yup.string().required(),
      auditor: Yup.string(),
      maquina: Yup.string(),
      setor: Yup.string(),
      acao: Yup.string(),
      responsavel: Yup.string(),
      data: Yup.date(),
      prazo: Yup.date(),
      conclusao: Yup.date(),
      area: Yup.string(),
      subitem: Yup.number(),
    });
    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: "Validation fails" });
    }
    const user = await User.findOne({
      where: {name: req.body.responsavel}
    });
    
    const question = await Question.findOne({
      where: {item: req.body.item}
    });
    const question_id = question.id;
    const user_id = user.id;
    const {
      item,
      problema,
      auditor,
      maquina,
      setor,
      acao,
      responsavel,
      data,
      prazo,
      conclusao,
      area,
      subitem,
      avatar_id,
      
    } = req.body;

    await Plan.create({
      item,
      problema,
      auditor,
      maquina,
      setor,
      acao,
      responsavel,
      data,
      prazo,
      conclusao,
      area,
      subitem,
      user_id,
      avatar_id,
      question_id,
    });
    const plan = await Plan.findOne({
        where: {item: req.body.item, problema: req.body.problema}
    });
   
    
    const { auditoria_id } = await Plan.update(req.params,{
      where: {id: plan.id}
    });
    
    

     /*await Mail.sendMail({
      to: `${user.name} <${user.email}>`,
      subject: 'Nova ação',
      template: 'newplan',
      context: {
        name: user.name,
        setor: req.body.setor,
        maquina: req.body.maquina,
        problema: req.body.problema,
      }
    }); */

  
    return res.json({
      item,
      problema,
      auditor,
      maquina,
      setor,
      acao,
      responsavel,
      data,
      prazo,
      conclusao,
      area,
      subitem,
    });
    
  }
  async index(req, res) {
    const plan = await Plan.findAll({
      attributes: ["id","item","area", "problema", "acao", "maquina", "setor","responsavel","data","prazo","conclusao","subitem"],
      include: [
        {
          model: Auditoria,
          as: 'auditoria',
          attributes: ['id','data','turno','auditor'],
        }, {
          model: File,
          as: 'file',
          attributes: ["id","name","path","url"]
        },{
          model: Question,
          as: 'question',
          attributes: ["item","text"]
        },
      ],
    });
    return res.json(plan);
  }

  async update (req, res){
    const schema = Yup.object().shape({
      item: Yup.string(),
      problema: Yup.string(),
      auditor: Yup.string(),
      maquina: Yup.string(),
      setor: Yup.string(),
      responsavel: Yup.string(),
      data: Yup.date(),
      prazo: Yup.date(),
      conclusao: Yup.date(),
      area: Yup.number()
    });
    if(!(await schema.isValid(req.body))){
      return res.status(400).json({error: "Validation fails"})
    }
    const plan = await Plan.findByPk(req.params.id);
    

    if(!plan){
      return res.status(400).json({error: "This event not exist"});
    }
    const {
       item, 
       problema,
       auditor, 
       maquina, 
       setor, 
       responsavel, 
       data, 
       prazo, 
       conclusao,
       area
      } = await plan.update(req.body);
      return res.json ({
        item, 
        problema,
        auditor, 
        maquina, 
        setor, 
        responsavel, 
        data, 
        prazo, 
        conclusao,
        area
      })
  }

  async delete (req, res){
    const plan = await Plan.findByPk(req.params.id);
    if(!plan){
      return res.status(400).json({error: "Plan not exist"});
    }
    await Plan.destroy({ where: {id: req.params.id}});
    const plan2 = await Plan.findAll();
    return res.json(plan2);

  }
}

export default new ListController();
