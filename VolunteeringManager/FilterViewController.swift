//
//  FilterViewController.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/10/21.
//

import UIKit
import CoreData

class FilterViewController: UIViewController {

    @IBOutlet weak var textFieldCityZipCode: UITextField!
    
    @IBOutlet weak var btnCOVID: UISwitch!
    var COVID = false
    @IBOutlet weak var btnVirtual: UISwitch!
    var virtual = false
    
    // Cause Buttons
    @IBOutlet weak var causeButtonAdvHumanRights: UIButton!
    var bCauseBtnAdvHumanRight = false
    @IBOutlet weak var causeButtonAnimals: UIButton!
    var bCauseBtnAnimals = false
    @IBOutlet weak var causeButtonArtsCulture: UIButton!
    var bCauseBtnArtsCulture = false
    @IBOutlet weak var causeButtonBoardDev: UIButton!
    var bCauseBtnBoardDev = false
    @IBOutlet weak var causeButtonChildrenYouth: UIButton!
    var bCauseBtnChildrenYouth = false
    @IBOutlet weak var causeButtonCommunity: UIButton!
    var bCauseBtnCommunity = false
    @IBOutlet weak var causeButtonComputerTech: UIButton!
    var bCauseBtnComputerTech = false
    @IBOutlet weak var causeButtonCrisisSupport: UIButton!
    var bCauseBtnCrisisSupport = false
    @IBOutlet weak var causeButtonDisasterRelief: UIButton!
    var bCauseBtnDisasterRelief = false
    @IBOutlet weak var causeButtonEducationLitracy: UIButton!
    var bCauseBtnEducationLitracy = false
    @IBOutlet weak var causeButtonEmergencySafety: UIButton!
    var bCauseBtnEmergencySafety = false
    @IBOutlet weak var causeButtonEmployment: UIButton!
    var bCauseBtnEmployment = false
    @IBOutlet weak var causeButtonEnvironment: UIButton!
    var bCauseBtnEnvironment = false
    @IBOutlet weak var causeButtonFaith: UIButton!
    var bCauseBtnFaith = false
    @IBOutlet weak var causeButtonHealthMedicine: UIButton!
    var bCauseBtnHealthMedicine = false
    @IBOutlet weak var causeButtonHomelessHousing: UIButton!
    var bCauseBtnHomelessHousing = false
    @IBOutlet weak var causeButtonHunger: UIButton!
    var bCauseBtnHunger = false
    @IBOutlet weak var causeButtonImmigrantRefygees: UIButton!
    var bCauseBtnImmigrantRefygees = false
    @IBOutlet weak var causeButtonInternational: UIButton!
    var bCauseBtnInternational = false
    @IBOutlet weak var causeButtonJusticeLegal: UIButton!
    var bCauseBtnJusticeLegal = false
    @IBOutlet weak var causeButtonLGBTQ: UIButton!
    var bCauseBtnLGBTQ = false
    @IBOutlet weak var causeButtonMediaBroadcasting: UIButton!
    var bCauseBtnMediaBroadcasting = false
    @IBOutlet weak var causeButtonDisabilities: UIButton!
    var bCauseBtnDisabilities = false
    @IBOutlet weak var causeButtonPolitics: UIButton!
    var bCauseBtnPolitics = false
    @IBOutlet weak var causeButtonRaceEthnicity: UIButton!
    var bCauseBtnRaceEthnicity = false
    @IBOutlet weak var causeButtonSeniors: UIButton!
    var bCauseBtnAdvSeniors = false
    @IBOutlet weak var causeButtonSportsRecreation: UIButton!
    var bCauseBtnSportsRecreation = false
    @IBOutlet weak var causeButtonVeteranMilitary: UIButton!
    var bCauseBtnVeteranMilitary = false
    @IBOutlet weak var causeButtonWomen: UIButton!
    var bCauseBtnWomen = false

    // Skills Buttons

    @IBOutlet weak var skillButtonAcademics: UIButton!
    var bSkillBtnAcademics = false
    @IBOutlet weak var skillButtonAdministration: UIButton!
    var bSkillBtnAdministration = false
    @IBOutlet weak var skillButtonAnimalEnvironment: UIButton!
    var bSkillBtnAnimalEnvironment = false
    @IBOutlet weak var skillButtonArt: UIButton!
    var bSkillBtnArt = false
    @IBOutlet weak var skillButtonBizMgmt: UIButton!
    var bSkillBtnBizMgmt = false
    @IBOutlet weak var skillButtonChildrenFamily: UIButton!
    var bSkillBtnChildrenFamily = false
    @IBOutlet weak var skillButtonComputerIT: UIButton!
    var bSkillBtnComputerIT = false
    @IBOutlet weak var skillButtonDisasterRelief: UIButton!
    var bSkillBtnDisasterRelief = false
    @IBOutlet weak var skillButtonEduLiteracy: UIButton!
    var bSkillBtnEduLiteracy = false
    @IBOutlet weak var skillButtonEngineering: UIButton!
    var bSkillBtnEngineering = false
    @IBOutlet weak var skillButtonFinance: UIButton!
    var bSkillBtnFinance = false
    @IBOutlet weak var skillButtonFoodEvents: UIButton!
    var bSkillBtnFoodEvents = false
    @IBOutlet weak var skillButtonForProfitNonprofitDev: UIButton!
    var bSkillBtnForProfitNonprofitDev = false
    @IBOutlet weak var skillButtonHR: UIButton!
    var bSkillBtnHR = false
    @IBOutlet weak var skillButtonHealthcareSocialService: UIButton!
    var bSkillBtnHealthcareSocialService = false
    @IBOutlet weak var skillButtonHobbyCraft: UIButton!
    var bSkillBtnHobbyCraft = false
    @IBOutlet weak var skillButtonHousingFacilities: UIButton!
    var bSkillBtnHousingFacilities = false
    @IBOutlet weak var skillButtonITInfrastructureSoftware: UIButton!
    var bSkillBtnITInfrastructureSoftware = false
    @IBOutlet weak var skillButtonInteractiveWebDev: UIButton!
    var bSkillBtnInteractiveWebDev = false
    @IBOutlet weak var skillButtonInterpersonal: UIButton!
    var bSkillBtnInterpersonal = false
    @IBOutlet weak var skillButtonLanguageCulture: UIButton!
    var bSkillBtnLanguageCulture = false
    @IBOutlet weak var skillButtonLegalAdvocacy: UIButton!
    var bSkillBtnLegalAdvocacy = false
    @IBOutlet weak var skillButtonLogisticsSupplyChainTransportation: UIButton!
    var bSkillBtnLogisticsSupplyChainTransportation = false
    @IBOutlet weak var skillButtonMarketingCommunication: UIButton!
    var bSkillBtnMarketingCommunication = false
    @IBOutlet weak var skillButtonMusics: UIButton!
    var bSkillBtnMusics = false
    @IBOutlet weak var skillButtonPerforming: UIButton!
    var bSkillBtnPerforming = false
    @IBOutlet weak var skillButtonSportsRecreation: UIButton!
    var bSkillBtnSportsRecreation = false
    @IBOutlet weak var skillButtonStrategyDevBizPlanning: UIButton!
    var bSkillBtnStrategyDevBizPlanning = false
    @IBOutlet weak var skillButtonTrade: UIButton!
    var bSkillBtnTrade = false



//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    


    @IBAction func FilterSaveButtonClicked(_ sender: Any) {
        
        if btnCOVID.isOn {
            COVID = true
        } else {
            COVID = false
        }
        
        if btnVirtual.isOn {
            virtual = true
        } else {
            virtual = false
        }

        // Remove all causes and skills data and then save the updated data
        for _ in 0..<causes!.count {
            let cause = causes![0]
            context.delete(cause)
            causes?.removeFirst()
        }
        for _ in 0..<skills!.count {
            let skill = skills![0]
            context.delete(skill)
            skills?.removeFirst()
        }
        UpdateCOVID(preference: COVID)
        UpdateVirtual(preference: virtual)
        UpdateCausesAndSkills()
        UpdateViewBasedOnUser()
    };
        
    @IBAction func CauseButtonAdvHumanRightClicked(_ sender: Any) {
        bCauseBtnAdvHumanRight.toggle()
        if bCauseBtnAdvHumanRight {
            causeButtonAdvHumanRights.backgroundColor = UIColor.orange
        } else {
            causeButtonAdvHumanRights.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonAnimalClicked(_ sender: Any) {
        bCauseBtnAnimals.toggle()
        if bCauseBtnAnimals {
            causeButtonAnimals.backgroundColor = UIColor.orange
        } else {
            causeButtonAnimals.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonArtCultureClicked(_ sender: Any) {
        bCauseBtnArtsCulture.toggle()
        if bCauseBtnArtsCulture {
            causeButtonArtsCulture.backgroundColor = UIColor.orange
        } else {
            causeButtonArtsCulture.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonBoardDevClicked(_ sender: Any) {
        bCauseBtnBoardDev.toggle()
        if bCauseBtnBoardDev {
            causeButtonBoardDev.backgroundColor = UIColor.orange
        } else {
            causeButtonBoardDev.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonChildrenYouthClicked(_ sender: Any) {
        bCauseBtnChildrenYouth.toggle()
        if bCauseBtnChildrenYouth {
            causeButtonChildrenYouth.backgroundColor = UIColor.orange
        } else {
            causeButtonChildrenYouth.backgroundColor = UIColor.white
        }
    }

    @IBAction func CauseButtonCommunityClicked(_ sender: Any) {
        bCauseBtnCommunity.toggle()
        if bCauseBtnCommunity {
            causeButtonCommunity.backgroundColor = UIColor.orange
        } else {
            causeButtonCommunity.backgroundColor = UIColor.white
        }
    }

    @IBAction func CauseButtonComputerTechClicked(_ sender: Any) {
        bCauseBtnComputerTech.toggle()
        if bCauseBtnComputerTech {
            causeButtonComputerTech.backgroundColor = UIColor.orange
        } else {
            causeButtonComputerTech.backgroundColor = UIColor.white
        }
    }

    @IBAction func CauseButtonCrisisSuppClicked(_ sender: Any) {
        bCauseBtnCrisisSupport.toggle()
        if bCauseBtnCrisisSupport {
            causeButtonCrisisSupport.backgroundColor = UIColor.orange
        } else {
            causeButtonCrisisSupport.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonDisasterReliefClicked(_ sender: Any) {
        bCauseBtnDisasterRelief.toggle()
        if bCauseBtnDisasterRelief {
            causeButtonDisasterRelief.backgroundColor = UIColor.orange
        } else {
            causeButtonDisasterRelief.backgroundColor = UIColor.white
        }
    }
        
    @IBAction func CauseButtonEduLiteracyClicked(_ sender: Any) {
        bCauseBtnEducationLitracy.toggle()
        if bCauseBtnEducationLitracy {
            causeButtonEducationLitracy.backgroundColor = UIColor.orange
        } else {
            causeButtonEducationLitracy.backgroundColor = UIColor.white
        }
    }
    @IBAction func CauseButtonEmergencySafetyClicked(_ sender: Any) {
        bCauseBtnEmergencySafety.toggle()
        if bCauseBtnEmergencySafety {
            causeButtonEmergencySafety.backgroundColor = UIColor.orange
        } else {
            causeButtonEmergencySafety.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonEmploymentClicked(_ sender: Any) {
        bCauseBtnEmployment.toggle()
        if bCauseBtnEmployment {
            causeButtonEmployment.backgroundColor = UIColor.orange
        } else {
            causeButtonEmployment.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonEnvironmentClicked(_ sender: Any) {
        bCauseBtnEnvironment.toggle()
        if bCauseBtnEnvironment {
            causeButtonEnvironment.backgroundColor = UIColor.orange
        } else {
            causeButtonEnvironment.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonFaithClicked(_ sender: Any) {
        bCauseBtnFaith.toggle()
        if bCauseBtnFaith {
            causeButtonFaith.backgroundColor = UIColor.orange
        } else {
            causeButtonFaith.backgroundColor = UIColor.white
        }
    }

    @IBAction func CauseButtonHealthMedicineClicked(_ sender: Any) {
        bCauseBtnHealthMedicine.toggle()
        if bCauseBtnHealthMedicine {
            causeButtonHealthMedicine.backgroundColor = UIColor.orange
        } else {
            causeButtonHealthMedicine.backgroundColor = UIColor.white
        }
    }
    @IBAction func CauseButtonHomelessHousingClicked(_ sender: Any) {
        bCauseBtnHomelessHousing.toggle()
        if bCauseBtnHomelessHousing {
            causeButtonHomelessHousing.backgroundColor = UIColor.orange
        } else {
            causeButtonHomelessHousing.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonHungerClicked(_ sender: Any) {
        bCauseBtnHunger.toggle()
        if bCauseBtnHunger {
            causeButtonHunger.backgroundColor = UIColor.orange
        } else {
            causeButtonHunger.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonImmigrantClicked(_ sender: Any) {
        bCauseBtnImmigrantRefygees.toggle()
        if bCauseBtnImmigrantRefygees {
            causeButtonImmigrantRefygees.backgroundColor = UIColor.orange
        } else {
            causeButtonImmigrantRefygees.backgroundColor = UIColor.white
        }
    }

    @IBAction func CauseButtonInternationalClicked(_ sender: Any) {
        bCauseBtnInternational.toggle()
        if bCauseBtnInternational {
            causeButtonInternational.backgroundColor = UIColor.orange
        } else {
            causeButtonInternational.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonJusticeLegalClicked(_ sender: Any) {
        bCauseBtnJusticeLegal.toggle()
        if bCauseBtnJusticeLegal {
            causeButtonJusticeLegal.backgroundColor = UIColor.orange
        } else {
            causeButtonJusticeLegal.backgroundColor = UIColor.white
        }
    }
    @IBAction func CauseButtonLGBTQClicked(_ sender: Any) {
        bCauseBtnLGBTQ.toggle()
        if bCauseBtnLGBTQ {
            causeButtonLGBTQ.backgroundColor = UIColor.orange
        } else {
            causeButtonLGBTQ.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonMediaBroadcastingClicked(_ sender: Any) {
        bCauseBtnMediaBroadcasting.toggle()
        if bCauseBtnMediaBroadcasting {
            causeButtonMediaBroadcasting.backgroundColor = UIColor.orange
        } else {
            causeButtonMediaBroadcasting.backgroundColor = UIColor.white
        }
    }
    @IBAction func CauseButtonDisabilitiesClicked(_ sender: Any) {
        bCauseBtnDisabilities.toggle()
        if bCauseBtnDisabilities {
            causeButtonDisabilities.backgroundColor = UIColor.orange
        } else {
            causeButtonDisabilities.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonPoliticsClicked(_ sender: Any) {
        bCauseBtnPolitics.toggle()
        if bCauseBtnPolitics {
            causeButtonPolitics.backgroundColor = UIColor.orange
        } else {
            causeButtonPolitics.backgroundColor = UIColor.white
        }
    }

    @IBAction func CauseButtonRaceEthnicityClicked(_ sender: Any) {
        bCauseBtnRaceEthnicity.toggle()
        if bCauseBtnRaceEthnicity {
            causeButtonRaceEthnicity.backgroundColor = UIColor.orange
        } else {
            causeButtonRaceEthnicity.backgroundColor = UIColor.white
        }
    }
    @IBAction func CauseButtonSeniorsClicked(_ sender: Any) {
        bCauseBtnAdvSeniors.toggle()
        if bCauseBtnAdvSeniors {
            causeButtonSeniors.backgroundColor = UIColor.orange
        } else {
            causeButtonSeniors.backgroundColor = UIColor.white
        }
    }

    @IBAction func CauseButtonSportRecreationClicked(_ sender: Any) {
        bCauseBtnSportsRecreation.toggle()
        if bCauseBtnSportsRecreation {
            causeButtonSportsRecreation.backgroundColor = UIColor.orange
        } else {
            causeButtonSportsRecreation.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonVeteranMilitaryClicked(_ sender: Any) {
        bCauseBtnVeteranMilitary.toggle()
        if bCauseBtnVeteranMilitary {
            causeButtonVeteranMilitary.backgroundColor = UIColor.orange
        } else {
            causeButtonVeteranMilitary.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func CauseButtonWomenClicked(_ sender: Any) {
        bCauseBtnWomen.toggle()
        if bCauseBtnWomen {
            causeButtonWomen.backgroundColor = UIColor.orange
        } else {
            causeButtonWomen.backgroundColor = UIColor.white
        }
    }
    
    // Skill Button Handlers
    @IBAction func SkillButtonAcademicsClicked(_ sender: Any) {
        bSkillBtnAcademics.toggle()
        if bSkillBtnAcademics {
            skillButtonAcademics.backgroundColor = UIColor.orange
        } else {
            skillButtonAcademics.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonAdministrativeClicked(_ sender: Any) {
        bSkillBtnAdministration.toggle()
        if bSkillBtnAdministration {
            skillButtonAdministration.backgroundColor = UIColor.orange
        } else {
            skillButtonAdministration.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonAnimalEnvClicked(_ sender: Any) {
        bSkillBtnAnimalEnvironment.toggle()
        if bSkillBtnAnimalEnvironment {
            skillButtonAnimalEnvironment.backgroundColor = UIColor.orange
        } else {
            skillButtonAnimalEnvironment.backgroundColor = UIColor.white
        }
    }

    @IBAction func SkillButtonArtClicked(_ sender: Any) {
        bSkillBtnArt.toggle()
        if bSkillBtnArt {
            skillButtonArt.backgroundColor = UIColor.orange
        } else {
            skillButtonArt.backgroundColor = UIColor.white
        }
    }
    @IBAction func SkillButtonBizDevClicked(_ sender: Any) {
        bSkillBtnBizMgmt.toggle()
        if bSkillBtnBizMgmt {
            skillButtonBizMgmt.backgroundColor = UIColor.orange
        } else {
            skillButtonBizMgmt.backgroundColor = UIColor.white
        }
    }

    @IBAction func SkillButtonChildrenFamilyClicked(_ sender: Any) {
        bSkillBtnChildrenFamily.toggle()
        if bSkillBtnChildrenFamily {
            skillButtonChildrenFamily.backgroundColor = UIColor.orange
        } else {
            skillButtonChildrenFamily.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonComputerITClicked(_ sender: Any) {
        bSkillBtnComputerIT.toggle()
        if bSkillBtnComputerIT {
            skillButtonComputerIT.backgroundColor = UIColor.orange
        } else {
            skillButtonComputerIT.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonDisasterReliefClicked(_ sender: Any) {
        bSkillBtnDisasterRelief.toggle()
        if bSkillBtnDisasterRelief {
            skillButtonDisasterRelief.backgroundColor = UIColor.orange
        } else {
            skillButtonDisasterRelief.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonEduLitClicked(_ sender: Any) {
        bSkillBtnEduLiteracy.toggle()
        if bSkillBtnEduLiteracy {
            skillButtonEduLiteracy.backgroundColor = UIColor.orange
        } else {
            skillButtonEduLiteracy.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonEngineeringClicked(_ sender: Any) {
        bSkillBtnEngineering.toggle()
        if bSkillBtnEngineering {
            skillButtonEngineering.backgroundColor = UIColor.orange
        } else {
            skillButtonEngineering.backgroundColor = UIColor.white
        }
    }

    @IBAction func SkillButtonFinanceClicked(_ sender: Any) {
        bSkillBtnFinance.toggle()
        if bSkillBtnFinance {
            skillButtonFinance.backgroundColor = UIColor.orange
        } else {
            skillButtonFinance.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonFoodServiceClicked(_ sender: Any) {
        bSkillBtnFoodEvents.toggle()
        if bSkillBtnFoodEvents {
            skillButtonFoodEvents.backgroundColor = UIColor.orange
        } else {
            skillButtonFoodEvents.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonForProfitNonProfitDevClicked(_ sender: Any) {
        bSkillBtnForProfitNonprofitDev.toggle()
        if bSkillBtnForProfitNonprofitDev {
            skillButtonForProfitNonprofitDev.backgroundColor = UIColor.orange
        } else {
            skillButtonForProfitNonprofitDev.backgroundColor = UIColor.white
        }
    }

    @IBAction func SkillButtonHRClicked(_ sender: Any) {
        bSkillBtnHR.toggle()
        if bSkillBtnHR {
            skillButtonHR.backgroundColor = UIColor.orange
        } else {
            skillButtonHR.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonHealthcareSocialServClicked(_ sender: Any) {
        bSkillBtnHealthcareSocialService.toggle()
        if bSkillBtnHealthcareSocialService {
            skillButtonHealthcareSocialService.backgroundColor = UIColor.orange
        } else {
            skillButtonHealthcareSocialService.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonHobbiesCraftsClicked(_ sender: Any) {
        bSkillBtnHobbyCraft.toggle()
        if bSkillBtnHobbyCraft {
            skillButtonHobbyCraft.backgroundColor = UIColor.orange
        } else {
            skillButtonHobbyCraft.backgroundColor = UIColor.white
        }
    }

    @IBAction func SkillButtonHousingFacilitiesClicked(_ sender: Any) {
        bSkillBtnHousingFacilities.toggle()
        if bSkillBtnHousingFacilities {
            skillButtonHousingFacilities.backgroundColor = UIColor.orange
        } else {
            skillButtonHousingFacilities.backgroundColor = UIColor.white
        }
    }
    @IBAction func SkillButtonITInfrastructureSoftwareClicked(_ sender: Any) {
        bSkillBtnITInfrastructureSoftware.toggle()
        if bSkillBtnITInfrastructureSoftware {
            skillButtonITInfrastructureSoftware.backgroundColor = UIColor.orange
        } else {
            skillButtonITInfrastructureSoftware.backgroundColor = UIColor.white
        }
    }
    @IBAction func SkillButtonInteractiveWebDevClicked(_ sender: Any) {
        bSkillBtnInteractiveWebDev.toggle()
        if bSkillBtnInteractiveWebDev {
            skillButtonInteractiveWebDev.backgroundColor = UIColor.orange
        } else {
            skillButtonInteractiveWebDev.backgroundColor = UIColor.white
        }
    }

    @IBAction func SkillButtonInterpersonalClicked(_ sender: Any) {
        bSkillBtnInterpersonal.toggle()
        if bSkillBtnInterpersonal {
            skillButtonInterpersonal.backgroundColor = UIColor.orange
        } else {
            skillButtonInterpersonal.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonLanguageCultureClicked(_ sender: Any) {
        bSkillBtnLanguageCulture.toggle()
        if bSkillBtnLanguageCulture {
            skillButtonLanguageCulture.backgroundColor = UIColor.orange
        } else {
            skillButtonLanguageCulture.backgroundColor = UIColor.white
        }
    }
    @IBAction func SkillButtonLegalAdvocacyClicked(_ sender: Any) {
        bSkillBtnLegalAdvocacy.toggle()
        if bSkillBtnLegalAdvocacy {
            skillButtonLegalAdvocacy.backgroundColor = UIColor.orange
        } else {
            skillButtonLegalAdvocacy.backgroundColor = UIColor.white
        }
    }

    @IBAction func SkillButtonLogisticsSCTransportationClicked(_ sender: Any) {
        bSkillBtnLogisticsSupplyChainTransportation.toggle()
        if bSkillBtnLogisticsSupplyChainTransportation {
            skillButtonLogisticsSupplyChainTransportation.backgroundColor = UIColor.orange
        } else {
            skillButtonLogisticsSupplyChainTransportation.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonMarketingCommunicationClicked(_ sender: Any) {
        bSkillBtnMarketingCommunication.toggle()
        if bSkillBtnMarketingCommunication {
            skillButtonMarketingCommunication.backgroundColor = UIColor.orange
        } else {
            skillButtonMarketingCommunication.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonMusicsClicked(_ sender: Any) {
        bSkillBtnMusics.toggle()
        if bSkillBtnMusics {
            skillButtonMusics.backgroundColor = UIColor.orange
        } else {
            skillButtonMusics.backgroundColor = UIColor.white
        }
    }

    @IBAction func SkillButtonPerformingClicked(_ sender: Any) {
        bSkillBtnPerforming.toggle()
        if bSkillBtnPerforming {
            skillButtonPerforming.backgroundColor = UIColor.orange
        } else {
            skillButtonPerforming.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func SkillButtonSportsRecreationClicked(_ sender: Any) {
        bSkillBtnStrategyDevBizPlanning.toggle()
        if bSkillBtnStrategyDevBizPlanning {
            skillButtonSportsRecreation.backgroundColor = UIColor.orange
        } else {
            skillButtonSportsRecreation.backgroundColor = UIColor.white
        }
    }
    @IBAction func SkillButtonStrategyDevBizPlanningClicked(_ sender: Any) {
        bSkillBtnStrategyDevBizPlanning.toggle()
        if bSkillBtnStrategyDevBizPlanning {
            skillButtonStrategyDevBizPlanning.backgroundColor = UIColor.orange
        } else {
            skillButtonStrategyDevBizPlanning.backgroundColor = UIColor.white
        }
    }
    @IBAction func SkillButtonTradesClicked(_ sender: Any) {
        bSkillBtnTrade.toggle()
        if bSkillBtnTrade {
            skillButtonTrade.backgroundColor = UIColor.orange
        } else {
            skillButtonTrade.backgroundColor = UIColor.white
        }
    }

    
    func fetchData () {
        fetchUser()
        fetchCausesAndSkillsData()
        
        if users!.count >= 1 {
            let covidPreference = users![0].covid
            let virtualPreference = users![0].virtual
            
            if covidPreference {
                COVID = true
            }
            
            if virtualPreference {
                virtual = true
            }
        }
        
        for i in 0..<causes!.count {
            let txtCause_ = causes![i].cause
            switch txtCause_ {
            case "Advocacy & Human Rights":
                bCauseBtnAdvHumanRight = true
            case "Animals":
                bCauseBtnAnimals = true
            case "Arts & Culture":
                bCauseBtnArtsCulture = true
            case "Board Development":
                bCauseBtnBoardDev = true
            case "Children & Youth":
                bCauseBtnChildrenYouth = true
            case "Community":
                bCauseBtnCommunity = true
            case "Computers & Technology":
                bCauseBtnComputerTech = true
            case "Crisis Support":
                bCauseBtnCrisisSupport = true
            case "Disaster Relief":
                bCauseBtnDisasterRelief = true
            case "Education & Literacy":
                bCauseBtnEducationLitracy = true
            case "Emergency & Safety":
                bCauseBtnEmergencySafety = true
            case "Employment":
                bCauseBtnEmployment = true
            case "Environment":
                bCauseBtnEnvironment = true
            case "Faith-Based":
                bCauseBtnFaith = true
            case "Health & Medicine":
                bCauseBtnHealthMedicine = true
            case "Homeless & Housing":
                bCauseBtnHomelessHousing = true
            case "Hunger":
                bCauseBtnHunger = true
            case "Immigrants & Refugees":
                bCauseBtnImmigrantRefygees = true
            case "International":
                bCauseBtnInternational = true
            case "Justice & Legal":
                bCauseBtnJusticeLegal = true
            case "LGBTQ+":
                bCauseBtnLGBTQ = true
            case "Media & Broadcasting":
                bCauseBtnMediaBroadcasting = true
            case "People with Disabilities":                bCauseBtnDisabilities = true
            case "Politics":
                bCauseBtnPolitics = true
            case "Race & Ethnicity":
                bCauseBtnRaceEthnicity = true
            case "Seniors":
                bCauseBtnAdvSeniors = true
            case "Sports & Recreation":
                bCauseBtnSportsRecreation = true
            case "Veterans & Military Families":
                bCauseBtnVeteranMilitary = true
            case "Women":
                bCauseBtnWomen = true
            case .none: break
            case .some(_): break
                
            }
        }
                
        for i in 0..<skills!.count {
            let txtSkill_ = skills![i].skill
            switch txtSkill_ {
            case "Academics":
                bSkillBtnAcademics = true
            case "Administrative & Clerical":
                bSkillBtnAdministration = true
            case "Animals & Environment":
                bSkillBtnAnimalEnvironment = true
            case "Arts":
                bSkillBtnArt = true;
            case "Business & Management":
                bSkillBtnBizMgmt = true
            case "Children & Family":
                bSkillBtnChildrenFamily = true
            case "Computers & IT":
                bSkillBtnComputerIT = true
            case "Disaster Relief":
                bSkillBtnDisasterRelief = true
            case "Education & Literacy":
                bSkillBtnEduLiteracy = true
            case "Engineering":
                bSkillBtnEngineering = true
            case "Finance":
                bSkillBtnFinance = true
            case "Food Services & Events":
                bSkillBtnFoodEvents = true
            case "For Profit & Nonprofit Development":
                bSkillBtnForProfitNonprofitDev = true
            case "HR":
                bSkillBtnHR = true
            case "Healthcare & Social Services":
                bSkillBtnHealthcareSocialService = true
            case "Hobbies & Crafts":
                bSkillBtnHobbyCraft = true
            case "Housing & Facilities":
                bSkillBtnHousingFacilities = true
            case "IT Infrastructure & Software":
                bSkillBtnITInfrastructureSoftware = true
            case "Interactive & Web Development":
                bSkillBtnInteractiveWebDev = true
            case "Interpersonal":
                bSkillBtnInterpersonal = true
            case "Language & Cultire":
                bSkillBtnLanguageCulture = true
            case "Legal & Advocacy":
                bSkillBtnLegalAdvocacy = true
            case "Logistics, Supply Chain & Transportation":
                bSkillBtnLogisticsSupplyChainTransportation = true
            case "Marketing & Communications":
                bSkillBtnMarketingCommunication = true
            case "Music":
                bSkillBtnMusics = true
            case "Performing Arts":
                bSkillBtnPerforming = true
            case "Sports & Recreation":
                bSkillBtnSportsRecreation = true
            case "Strategy Development & Business Planning":
                bSkillBtnStrategyDevBizPlanning = true
            case "Trades":
                bSkillBtnTrade = true
            case .none: break
            case .some(_): break
            }
        }
    }
    
    func UpdateViewBasedOnUser () {
        if COVID {
            btnCOVID.setOn(true, animated: false)
        } else {
            btnCOVID.setOn(false, animated: false)
        }
        if virtual {
            btnVirtual.setOn(true, animated: false)
        } else {
            btnVirtual.setOn(false, animated: false)
        }
        if bCauseBtnAdvHumanRight {
            causeButtonAdvHumanRights.backgroundColor = UIColor.orange
        } else {
            causeButtonAdvHumanRights.backgroundColor = UIColor.white
        }
        if bCauseBtnAnimals {
            causeButtonAnimals.backgroundColor = UIColor.orange
        } else {
            causeButtonAnimals.backgroundColor = UIColor.white
        }
        
        if bCauseBtnArtsCulture {
            causeButtonArtsCulture.backgroundColor = UIColor.orange
        } else {
            causeButtonArtsCulture.backgroundColor = UIColor.white
        }
        
        if bCauseBtnBoardDev {
            causeButtonBoardDev.backgroundColor = UIColor.orange
        } else {
            causeButtonBoardDev.backgroundColor = UIColor.white
        }
        if bCauseBtnChildrenYouth {
            causeButtonChildrenYouth.backgroundColor = UIColor.orange
        } else {
            causeButtonChildrenYouth.backgroundColor = UIColor.white
        }

        if bCauseBtnCommunity {
            causeButtonCommunity.backgroundColor = UIColor.orange
        } else {
            causeButtonCommunity.backgroundColor = UIColor.white
        }
        if bCauseBtnComputerTech {
            causeButtonComputerTech.backgroundColor = UIColor.orange
        } else {
            causeButtonComputerTech.backgroundColor = UIColor.white
        }
        if bCauseBtnCrisisSupport {
            causeButtonCrisisSupport.backgroundColor = UIColor.orange
        } else {
            causeButtonCrisisSupport.backgroundColor = UIColor.white
        }
        if bCauseBtnDisasterRelief {
            causeButtonDisasterRelief.backgroundColor = UIColor.orange
        } else {
            causeButtonDisasterRelief.backgroundColor = UIColor.white
        }
        if bCauseBtnEducationLitracy {
            causeButtonEducationLitracy.backgroundColor = UIColor.orange
        } else {
            causeButtonEducationLitracy.backgroundColor = UIColor.white
        }
        if bCauseBtnEmergencySafety {
            causeButtonEmergencySafety.backgroundColor = UIColor.orange
        } else {
            causeButtonEmergencySafety.backgroundColor = UIColor.white
        }
        if bCauseBtnEmployment {
            causeButtonEmployment.backgroundColor = UIColor.orange
        } else {
            causeButtonEmployment.backgroundColor = UIColor.white
        }
        if bCauseBtnEnvironment {
            causeButtonEnvironment.backgroundColor = UIColor.orange
        } else {
            causeButtonEnvironment.backgroundColor = UIColor.white
        }
        if bCauseBtnFaith {
            causeButtonFaith.backgroundColor = UIColor.orange
        } else {
            causeButtonFaith.backgroundColor = UIColor.white
        }
        if bCauseBtnHealthMedicine {
            causeButtonHealthMedicine.backgroundColor = UIColor.orange
        } else {
            causeButtonHealthMedicine.backgroundColor = UIColor.white
        }
        if bCauseBtnHomelessHousing {
            causeButtonHomelessHousing.backgroundColor = UIColor.orange
        } else {
            causeButtonHomelessHousing.backgroundColor = UIColor.white
        }
        if bCauseBtnHunger {
            causeButtonHunger.backgroundColor = UIColor.orange
        } else {
            causeButtonHunger.backgroundColor = UIColor.white
        }
        if bCauseBtnImmigrantRefygees {
            causeButtonImmigrantRefygees.backgroundColor = UIColor.orange
        } else {
            causeButtonImmigrantRefygees.backgroundColor = UIColor.white
        }
        if bCauseBtnInternational {
            causeButtonInternational.backgroundColor = UIColor.orange
        } else {
            causeButtonInternational.backgroundColor = UIColor.white
        }
        if bCauseBtnJusticeLegal {
            causeButtonJusticeLegal.backgroundColor = UIColor.orange
        } else {
            causeButtonJusticeLegal.backgroundColor = UIColor.white
        }
        if bCauseBtnLGBTQ {
            causeButtonLGBTQ.backgroundColor = UIColor.orange
        } else {
            causeButtonLGBTQ.backgroundColor = UIColor.white
        }
        if bCauseBtnMediaBroadcasting {
            causeButtonMediaBroadcasting.backgroundColor = UIColor.orange
        } else {
            causeButtonMediaBroadcasting.backgroundColor = UIColor.white
        }
        if bCauseBtnDisabilities {
            causeButtonDisabilities.backgroundColor = UIColor.orange
        } else {
            causeButtonDisabilities.backgroundColor = UIColor.white
        }
        if bCauseBtnPolitics {
            causeButtonPolitics.backgroundColor = UIColor.orange
        } else {
            causeButtonPolitics.backgroundColor = UIColor.white
        }
        if bCauseBtnRaceEthnicity {
            causeButtonRaceEthnicity.backgroundColor = UIColor.orange
        } else {
            causeButtonRaceEthnicity.backgroundColor = UIColor.white
        }
        if bCauseBtnAdvSeniors {
            causeButtonSeniors.backgroundColor = UIColor.orange
        } else {
            causeButtonSeniors.backgroundColor = UIColor.white
        }
        if bCauseBtnSportsRecreation {
            causeButtonSportsRecreation.backgroundColor = UIColor.orange
        } else {
            causeButtonSportsRecreation.backgroundColor = UIColor.white
        }
        if bCauseBtnVeteranMilitary {
            causeButtonVeteranMilitary.backgroundColor = UIColor.orange
        } else {
            causeButtonVeteranMilitary.backgroundColor = UIColor.white
        }
        if bCauseBtnWomen {
            causeButtonWomen.backgroundColor = UIColor.orange
        } else {
            causeButtonWomen.backgroundColor = UIColor.white
        }
        if bSkillBtnAcademics {
            skillButtonAcademics.backgroundColor = UIColor.orange
        } else {
            skillButtonAcademics.backgroundColor = UIColor.white
        }
        if bSkillBtnAdministration {
            skillButtonAdministration.backgroundColor = UIColor.orange
        } else {
            skillButtonAdministration.backgroundColor = UIColor.white
        }
        if bSkillBtnAnimalEnvironment {
            skillButtonAnimalEnvironment.backgroundColor = UIColor.orange
        } else {
            skillButtonAnimalEnvironment.backgroundColor = UIColor.white
        }
        if bSkillBtnArt {
            skillButtonArt.backgroundColor = UIColor.orange
        } else {
            skillButtonArt.backgroundColor = UIColor.white
        }
        if bSkillBtnBizMgmt {
            skillButtonBizMgmt.backgroundColor = UIColor.orange
        } else {
            skillButtonBizMgmt.backgroundColor = UIColor.white
        }
        if bSkillBtnChildrenFamily {
            skillButtonChildrenFamily.backgroundColor = UIColor.orange
        } else {
            skillButtonChildrenFamily.backgroundColor = UIColor.white
        }
        if bSkillBtnComputerIT {
            skillButtonComputerIT.backgroundColor = UIColor.orange
        } else {
            skillButtonComputerIT.backgroundColor = UIColor.white
        }
        if bSkillBtnDisasterRelief {
            skillButtonDisasterRelief.backgroundColor = UIColor.orange
        } else {
            skillButtonDisasterRelief.backgroundColor = UIColor.white
        }
        if bSkillBtnEduLiteracy {
            skillButtonEduLiteracy.backgroundColor = UIColor.orange
        } else {
            skillButtonEduLiteracy.backgroundColor = UIColor.white
        }
        if bSkillBtnEngineering{
            skillButtonEngineering.backgroundColor = UIColor.orange
        } else {
            skillButtonEngineering.backgroundColor = UIColor.white
        }
        if bSkillBtnFinance {
            skillButtonFinance.backgroundColor = UIColor.orange
        } else {
            skillButtonFinance.backgroundColor = UIColor.white
        }
        if bSkillBtnFoodEvents {
            skillButtonFoodEvents.backgroundColor = UIColor.orange
        } else {
            skillButtonFoodEvents.backgroundColor = UIColor.white
        }
        if bSkillBtnForProfitNonprofitDev {
            skillButtonForProfitNonprofitDev.backgroundColor = UIColor.orange
        } else {
            skillButtonForProfitNonprofitDev.backgroundColor = UIColor.white
        }
        if bSkillBtnHR {
            skillButtonHR.backgroundColor = UIColor.orange
        } else {
            skillButtonHR.backgroundColor = UIColor.white
        }
        if bSkillBtnHealthcareSocialService {
            skillButtonHealthcareSocialService.backgroundColor = UIColor.orange
        } else {
            skillButtonHealthcareSocialService.backgroundColor = UIColor.white
        }
        if bSkillBtnHobbyCraft {
            skillButtonHobbyCraft.backgroundColor = UIColor.orange
        } else {
            skillButtonHobbyCraft.backgroundColor = UIColor.white
        }
        if bSkillBtnHousingFacilities {
            skillButtonHousingFacilities.backgroundColor = UIColor.orange
        } else {
            skillButtonHousingFacilities.backgroundColor = UIColor.white
        }
        if bSkillBtnITInfrastructureSoftware {
            skillButtonITInfrastructureSoftware.backgroundColor = UIColor.orange
        } else {
            skillButtonITInfrastructureSoftware.backgroundColor = UIColor.white
        }
        if bSkillBtnInteractiveWebDev {
            skillButtonInteractiveWebDev.backgroundColor = UIColor.orange
        } else {
            skillButtonInteractiveWebDev.backgroundColor = UIColor.white
        }
        if bSkillBtnInterpersonal {
            skillButtonInterpersonal.backgroundColor = UIColor.orange
        } else {
            skillButtonInterpersonal.backgroundColor = UIColor.white
        }
        if bSkillBtnLanguageCulture {
            skillButtonLanguageCulture.backgroundColor = UIColor.orange
        } else {
            skillButtonLanguageCulture.backgroundColor = UIColor.white
        }
        if bSkillBtnLegalAdvocacy {
            skillButtonLegalAdvocacy.backgroundColor = UIColor.orange
        } else {
            skillButtonLegalAdvocacy.backgroundColor = UIColor.white
        }
        if bSkillBtnLogisticsSupplyChainTransportation {
            skillButtonLogisticsSupplyChainTransportation.backgroundColor = UIColor.orange
        } else {
            skillButtonLogisticsSupplyChainTransportation.backgroundColor = UIColor.white
        }
        if bSkillBtnMarketingCommunication {
            skillButtonMarketingCommunication.backgroundColor = UIColor.orange
        } else {
            skillButtonMarketingCommunication.backgroundColor = UIColor.white
        }
        if bSkillBtnMusics {
            skillButtonMusics.backgroundColor = UIColor.orange
        } else {
            skillButtonMusics.backgroundColor = UIColor.white
        }
        if bSkillBtnPerforming {
            skillButtonPerforming.backgroundColor = UIColor.orange
        } else {
            skillButtonPerforming.backgroundColor = UIColor.white
        }
        if bSkillBtnStrategyDevBizPlanning {
            skillButtonSportsRecreation.backgroundColor = UIColor.orange
        } else {
            skillButtonSportsRecreation.backgroundColor = UIColor.white
        }
        if bSkillBtnStrategyDevBizPlanning {
            skillButtonStrategyDevBizPlanning.backgroundColor = UIColor.orange
        } else {
            skillButtonStrategyDevBizPlanning.backgroundColor = UIColor.white
        }
        if bSkillBtnTrade {
            skillButtonTrade.backgroundColor = UIColor.orange
        } else {
            skillButtonTrade.backgroundColor = UIColor.white
        }
    }
    
    func UpdateCOVID(preference: Bool) {
        fetchUser()
        if users!.count >= 1 {
            if preference {
                users![0].covid = true
            } else {
                users![0].covid = false
            }
        }
    }
    
    func UpdateVirtual(preference: Bool) {
        fetchUser()
        if users!.count >= 1 {
            if preference {
                users![0].virtual = true
            } else {
                users![0].virtual = false
            }
        }
    }
    

        
    func UpdateCausesAndSkills() {
        if bCauseBtnAdvHumanRight {
            SaveCauseData(cause: "Advocacy & Human Rights")
        }
        if bCauseBtnAnimals {
            SaveCauseData(cause: "Animals")
        }
        if bCauseBtnArtsCulture {
            SaveCauseData(cause: "Arts & Culture")
        }
        if bCauseBtnBoardDev {
            SaveCauseData(cause: "Board Development")
        }
        if bCauseBtnChildrenYouth {
            SaveCauseData(cause: "Children & Youth")
        }
        if bCauseBtnCommunity {
            SaveCauseData(cause: "Community")
        }
        if bCauseBtnComputerTech {
            SaveCauseData(cause: "Computers & Technology")
        }
        if bCauseBtnCrisisSupport {
            SaveCauseData(cause: "Crisis Support")
        }
        if bCauseBtnDisasterRelief {
            SaveCauseData(cause: "Disaster Relief")
        }
        if bCauseBtnEducationLitracy {
            SaveCauseData(cause: "Education & Literacy")
        }
        if bCauseBtnEmergencySafety {
            SaveCauseData(cause: "Emergency & Safety")
        }
        if bCauseBtnEmployment {
            SaveCauseData(cause: "Employment")
        }
        if bCauseBtnEnvironment {
            SaveCauseData(cause: "Environment")
        }
        if bCauseBtnFaith {
            SaveCauseData(cause: "Faith-Based")
        }
        if bCauseBtnHealthMedicine {
            SaveCauseData(cause: "Health & Medicine")
        }
        if bCauseBtnHomelessHousing {
            SaveCauseData(cause: "Homeless & Housing")
        }
        if bCauseBtnHunger {
            SaveCauseData(cause: "Hunger")
        }
        if bCauseBtnImmigrantRefygees {
            SaveCauseData(cause: "Immigrants & Refugees")
        }
        if bCauseBtnInternational {
            SaveCauseData(cause: "International")
        }
        if bCauseBtnJusticeLegal {
            SaveCauseData(cause:  "Justice & Legal")
        }
        if bCauseBtnLGBTQ {
            SaveCauseData(cause: "LGBTQ+")
        }
        if bCauseBtnMediaBroadcasting {
            SaveCauseData(cause:  "Media & Broadcasting")
        }
        if bCauseBtnDisabilities {
            SaveCauseData(cause:  "People with Disabilities")
        }
        if bCauseBtnPolitics {
            SaveCauseData(cause:  "Politics")
        }
        if bCauseBtnRaceEthnicity {
            SaveCauseData(cause:  "Race & Ethnicity")
        }
        if bCauseBtnAdvSeniors {
            SaveCauseData(cause: "Seniors")
        }
        if bCauseBtnSportsRecreation {
            SaveCauseData(cause: "Sports & Recreation")
        }
        if bCauseBtnVeteranMilitary {
            SaveCauseData(cause: "Veterans & Military Families")
        }
        if bCauseBtnWomen {
            SaveCauseData(cause: "Women")
        }

        if bSkillBtnAcademics {
            SaveSkillData(skill: "Academics")
        }
        if bSkillBtnAdministration {
            SaveSkillData(skill: "Administrative & Clerical")
        }

        if bSkillBtnAnimalEnvironment {
            SaveSkillData(skill: "Animals & Environment")
        }
        if bSkillBtnArt {
            SaveSkillData(skill: "Arts")
        }
        if bSkillBtnBizMgmt {
            SaveSkillData(skill: "Business & Management")
        }
        if bSkillBtnChildrenFamily {
            SaveSkillData(skill: "Children & Family")
        }
        if bSkillBtnComputerIT {
            SaveSkillData(skill:  "Computers & IT")
        }
        if bSkillBtnDisasterRelief {
            SaveSkillData(skill: "Disaster Relief")
        }
        if bSkillBtnEduLiteracy {
            SaveSkillData(skill: "Education & Literacy")
        }
        if bSkillBtnEngineering {
            SaveSkillData(skill: "Engineering")
        }
        if bSkillBtnFinance {
                SaveSkillData(skill: "Finance")
        }
        if bSkillBtnFoodEvents {
                SaveSkillData(skill: "Food Services & Events")
        }
        if bSkillBtnForProfitNonprofitDev {
            SaveSkillData(skill: "For Profit & Nonprofit Development")
        }
        if bSkillBtnHR {
            SaveSkillData(skill: "HR")
        }
        if bSkillBtnHealthcareSocialService {
            SaveSkillData(skill: "Healthcare & Social Services")
        }
        if bSkillBtnHobbyCraft {
            SaveSkillData(skill: "Hobbies & Crafts")
        }
        if bSkillBtnHousingFacilities {
            SaveSkillData(skill: "Housing & Facilities")
        }
        if bSkillBtnITInfrastructureSoftware {
            SaveSkillData(skill: "IT Infrastructure & Software")
        }
        if bSkillBtnInteractiveWebDev {
            SaveSkillData(skill: "Interactive & Web Development")
        }
        if bSkillBtnInterpersonal {
            SaveSkillData(skill: "Interpersonal")
        }
        if bSkillBtnLanguageCulture {
            SaveSkillData(skill: "Language & Cultire")
        }
        if bSkillBtnLegalAdvocacy {
            SaveSkillData(skill: "Legal & Advocacy")
        }
        if bSkillBtnLogisticsSupplyChainTransportation {
            SaveSkillData(skill: "Logistics, Supply Chain & Transportation")
        }
        if bSkillBtnMarketingCommunication {
            SaveSkillData(skill: "Marketing & Communications")
        }
        if bSkillBtnMusics {
            SaveSkillData(skill: "Music")
        }
        if bSkillBtnPerforming {
            SaveSkillData(skill: "Performing Arts")
        }
        if bSkillBtnSportsRecreation {
            SaveSkillData(skill: "Sports & Recreation")
        }
        if bSkillBtnStrategyDevBizPlanning {
            SaveSkillData(skill: "Strategy Development & Business Planning")
        }
        if bSkillBtnTrade {
            SaveSkillData(skill: "Trades")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Pre-setup buttons based on user's previous selections
        
        fetchData()
        UpdateViewBasedOnUser()
        
    }
        
    
}
