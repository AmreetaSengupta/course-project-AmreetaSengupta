/***************************************************************************//**
 * @file
 * @brief Application code
 *******************************************************************************
 * # License
 * <b>Copyright 2018 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/

/* C Standard Library headers */
#include <stdio.h>

/* Bluetooth stack headers */
#include "bg_types.h"
#include "native_gecko.h"
#include "gatt_db.h"
#include "mesh_generic_model_capi_types.h"
#include "mesh_lib.h"

/* GPIO peripheral library */
#include <em_gpio.h>

/* Own header */
#include "app.h"

#include "src/gpio.h"
#include "src/ble_mesh_device_type.h"
#include "src/log.h"
#include "src/display.h"
#include "src/gecko_ble_errors.h"
#include "gpiointerrupt.h"

/// Flag for indicating DFU Reset must be performed
static uint8_t boot_to_dfu = 0;
struct gecko_msg_system_get_bt_address_rsp_t *add;
uint16_t idx_ele = 0;
uint8_t idx_trans = 0;

/***********************************************************************************************//**
 * @addtogroup Application
 * @{
 **************************************************************************************************/

/***********************************************************************************************//**
 * @addtogroup app
 * @{
 **************************************************************************************************/

/*******************************************************************************
 * Initialize used bgapi classes for server.
 ******************************************************************************/
void gecko_bgapi_classes_init_server_friend(void)
{
  gecko_bgapi_class_dfu_init();
  gecko_bgapi_class_system_init();
  gecko_bgapi_class_le_gap_init();
  gecko_bgapi_class_le_connection_init();
  //gecko_bgapi_class_gatt_init();
  gecko_bgapi_class_gatt_server_init();
  gecko_bgapi_class_hardware_init();
  gecko_bgapi_class_flash_init();
  gecko_bgapi_class_test_init();
  //gecko_bgapi_class_sm_init();
  gecko_bgapi_class_mesh_node_init();
  //gecko_bgapi_class_mesh_prov_init();
  gecko_bgapi_class_mesh_proxy_init();
  gecko_bgapi_class_mesh_proxy_server_init();
  //gecko_bgapi_class_mesh_proxy_client_init();
  //gecko_bgapi_class_mesh_generic_client_init();
  gecko_bgapi_class_mesh_generic_server_init();
  //gecko_bgapi_class_mesh_vendor_model_init();
  //gecko_bgapi_class_mesh_health_client_init();
  //gecko_bgapi_class_mesh_health_server_init();
  //gecko_bgapi_class_mesh_test_init();
  //gecko_bgapi_class_mesh_lpn_init();
  gecko_bgapi_class_mesh_friend_init();
  gecko_bgapi_class_mesh_lc_server_init();
  gecko_bgapi_class_mesh_lc_setup_server_init();
  gecko_bgapi_class_mesh_scene_server_init();
  gecko_bgapi_class_mesh_scene_setup_server_init();
}


/*******************************************************************************
 * Initialize used bgapi classes for server.
 ******************************************************************************/
void gecko_bgapi_classes_init_client_lpn(void)
{
	gecko_bgapi_class_dfu_init();
	gecko_bgapi_class_system_init();
	gecko_bgapi_class_le_gap_init();
	gecko_bgapi_class_le_connection_init();
	//gecko_bgapi_class_gatt_init();
	gecko_bgapi_class_gatt_server_init();
	gecko_bgapi_class_hardware_init();
	gecko_bgapi_class_flash_init();
	gecko_bgapi_class_test_init();
	//gecko_bgapi_class_sm_init();
	gecko_bgapi_class_mesh_node_init();
	//gecko_bgapi_class_mesh_prov_init();
	gecko_bgapi_class_mesh_proxy_init();
	gecko_bgapi_class_mesh_proxy_server_init();
	//gecko_bgapi_class_mesh_proxy_client_init();
	gecko_bgapi_class_mesh_generic_client_init();
	//gecko_bgapi_class_mesh_generic_server_init();
	//gecko_bgapi_class_mesh_vendor_model_init();
	//gecko_bgapi_class_mesh_health_client_init();
	//gecko_bgapi_class_mesh_health_server_init();
	//gecko_bgapi_class_mesh_test_init();
	gecko_bgapi_class_mesh_lpn_init();
	//gecko_bgapi_class_mesh_friend_init();
	gecko_bgapi_class_mesh_scene_client_init();
}

static void on_off_1(uint16_t idx_mod,
		uint16_t idx_ele,
		uint16_t c_add,
		uint16_t s_add,
		uint16_t idx_appkey,
		const struct mesh_generic_request *req,
		uint32_t tran_time,
		uint16_t delay_time,
		uint8_t req_flg)
{
	LOG_INFO("on_off_1");
	if(req->on_off == MESH_GENERIC_ON_OFF_STATE_ON)
	{
		displayPrintf(DISPLAY_ROW_TEMPVALUE,"Button Pressed");
	}
	else
	{
		displayPrintf(DISPLAY_ROW_TEMPVALUE,"Button Released");
	}

}
static void on_off_2(uint16_t idx_mod,
		uint16_t idx_ele,
		const struct mesh_generic_state *vcurr,
		const struct mesh_generic_state *vtar,
		uint32_t rem_time)
{
	LOG_INFO("on_off_2");
}


/*******************************************************************************
 * Handling of stack events. Both Bluetooth LE and Bluetooth mesh events
 * are handled here.
 * @param[in] evt_id  Incoming event ID.
 * @param[in] evt     Pointer to incoming event.
 ******************************************************************************/
/**************************** INSTRUCTIONS ************************************
 * 1. Before proceeding with assignment profile the project with attached blue
 * gecko and verify if it is being scanned by mobile mesh App.
 * 2. Use Bluetooth Mesh app from Silicon labs for the same and if you are not
 * able to get the app working checkout nRF Mesh App on play store.
 * 3. Add the necessary events for the mesh in switch (evt_id) similar to the
 * BLE assignments.
 * 4. Use the following pdf for reference
 * https://www.silabs.com/documents/public/reference-manuals/bluetooth-le-and-mesh-software-api-reference-manual.pdf
 * 5. Remember to check and log the return status for every Mesh API used.
 * 6. You can take the hints from light and switch example for mesh to know which
 * commands and events are needed and to understand the flow.
 ******************************************************************************/
void handle_ecen5823_gecko_event(uint32_t evt_id, struct gecko_cmd_packet *evt)
{
  if (NULL == evt) {
    return;
  }
  char name[25];
  switch (evt_id) {
    case gecko_evt_system_boot_id:

		add = gecko_cmd_system_get_bt_address();
		uint8_t *pub_add=(uint8_t *)&add->address;

    	if(DEVICE_USES_BLE_MESH_CLIENT_MODEL)
    	{
    		displayPrintf(DISPLAY_ROW_NAME,"Publisher");
    		sprintf(name, "5823Pub %02x%02x", pub_add[1], pub_add[0]);
    	}
    	if(DEVICE_USES_BLE_MESH_SERVER_MODEL)
    	{
    		displayPrintf(DISPLAY_ROW_NAME,"Subscriber");
    		sprintf(name, "5823Sub %02x%02x", pub_add[1], pub_add[0]);
    	}

    	displayPrintf(DISPLAY_ROW_BTADDR,name);
    	BTSTACK_CHECK_RESPONSE(gecko_cmd_gatt_server_write_attribute_value(gattdb_device_name, 0, strlen(name), (uint8 *)name));

		if(GPIO_PinInGet(Button_port,Button_pin)==0)
		{
			displayPrintf(DISPLAY_ROW_ACTION,"Factory Reset");
			BTSTACK_CHECK_RESPONSE(gecko_cmd_flash_ps_erase_all());
			BTSTACK_CHECK_RESPONSE(gecko_cmd_hardware_set_soft_timer(time_sec,t_handler,1));
		}
		else
		{
			BTSTACK_CHECK_RESPONSE(gecko_cmd_mesh_node_init());
		}

      break;

	  case gecko_evt_hardware_soft_timer_id:
		if(evt->data.evt_hardware_soft_timer.handle == t_handler)
		{
			gecko_cmd_system_reset(0);
		}
		break;

    case gecko_evt_mesh_node_initialized_id:
      if(!evt->data.evt_mesh_node_initialized.provisioned)
      {
    	  BTSTACK_CHECK_RESPONSE(gecko_cmd_mesh_node_start_unprov_beaconing(0x3));   // enable ADV and GATT provisioning bearer
      }
      else
      {
    	  displayPrintf(DISPLAY_ROW_ACTION,"Provisioned");

    	  if(DEVICE_USES_BLE_MESH_CLIENT_MODEL)
    	  {
	  			gecko_cmd_mesh_generic_client_init();
	  			GPIOINT_Init();
	  			GPIOINT_CallbackRegister(Button_pin, GPIO_callback);
	  			LOG_INFO("Return value in mesh_lib_init client is %d",mesh_lib_init(malloc,free,8));
    	  }

    	  if(DEVICE_USES_BLE_MESH_SERVER_MODEL)
    	  {
    		  gecko_cmd_mesh_generic_server_init();
    		  LOG_INFO("Return value in mesh_lib_init server is %d", mesh_lib_init(malloc,free,9));
    		  LOG_INFO("Return value in mesh_generic_lib_server_register_handler is %d", mesh_lib_generic_server_register_handler(MESH_GENERIC_ON_OFF_SERVER_MODEL_ID,0,on_off_1,on_off_2,NULL));
    		  LOG_INFO("Return value in mesh_lib_generic_server_publish is %d", mesh_lib_generic_server_publish(MESH_GENERIC_ON_OFF_SERVER_MODEL_ID,0,mesh_generic_state_on_off));
    	  }
      }
      break;

    case gecko_evt_le_connection_closed_id:
      /* Check if need to boot to dfu mode */
      if (boot_to_dfu) {
        /* Enter to DFU OTA mode */
        gecko_cmd_system_reset(2);
      }
      break;

    case gecko_evt_gatt_server_user_write_request_id:
      if (evt->data.evt_gatt_server_user_write_request.characteristic == gattdb_ota_control) {
        /* Set flag to enter to OTA mode */
        boot_to_dfu = 1;
        /* Send response to Write Request */
        gecko_cmd_gatt_server_send_user_write_response(
          evt->data.evt_gatt_server_user_write_request.connection,
          gattdb_ota_control,
          bg_err_success);

        /* Close connection to enter to DFU OTA mode */
        gecko_cmd_le_connection_close(evt->data.evt_gatt_server_user_write_request.connection);
      }
      break;

	case gecko_evt_mesh_node_provisioned_id:
		displayPrintf(DISPLAY_ROW_CONNECTION,"Provisioned");
		break;

	case gecko_evt_mesh_node_provisioning_failed_id:
		displayPrintf(DISPLAY_ROW_CONNECTION,"Provision Failed");
		break;

	case gecko_evt_mesh_generic_server_client_request_id:
		mesh_lib_generic_server_event_handler(evt);
		break;

	case gecko_evt_mesh_generic_server_state_changed_id:
		mesh_lib_generic_server_event_handler(evt);
		break;

	case gecko_evt_le_connection_opened_id:
		displayPrintf(DISPLAY_ROW_ACTION,"Connected");
		break;

	case gecko_evt_system_external_signal_id:

		LOG_INFO("Event External Signal");
		struct mesh_generic_request m_req;
		m_req.kind= mesh_generic_request_on_off;

		if (evt->data.evt_system_external_signal.extsignals & EVENT_PB0_RISING)
		{
			m_req.on_off=MESH_GENERIC_ON_OFF_STATE_ON;
		    LOG_INFO("Return value in mesh_lib_generic_client_publish is %x",mesh_lib_generic_client_publish(
					MESH_GENERIC_ON_OFF_CLIENT_MODEL_ID,
					idx_ele,
					idx_trans,
					&m_req,
					0,
					0,
					0
			));
		    idx_trans = idx_trans + 1;
		}
		if (evt->data.evt_system_external_signal.extsignals & EVENT_PB0_FALLING)
		{
			m_req.on_off=MESH_GENERIC_ON_OFF_STATE_OFF;
			LOG_INFO("Return value in mesh_lib_generic_client_publish is %x",mesh_lib_generic_client_publish(
					MESH_GENERIC_ON_OFF_CLIENT_MODEL_ID,
					idx_ele,
					idx_trans,
					&m_req,
					0,     // transition
					0,
					0     // flags
			));
			idx_trans = idx_trans + 1;
		}
		break;

	default:
		break;

  }
}

/** @} (end addtogroup app) */
/** @} (end addtogroup Application) */
