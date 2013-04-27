/*
 *	@file CBPeripheralManager.h
 *	@framework CoreBluetooth
 *
 *  @discussion Entry point to the peripheral role.
 *
 *	@copyright 2012 Apple, Inc. All rights reserved.
 */

#import <CoreBluetooth/CBDefines.h>
#import <CoreBluetooth/CBError.h>

#import <Foundation/Foundation.h>

/*!
 *  @enum CBPeripheralManagerState
 *
 *  @discussion Represents the current state of a CBPeripheralManager.
 *
 *  @constant CBPeripheralManagerStateUnknown       State unknown, update imminent.
 *  @constant CBPeripheralManagerStateResetting     The connection with the system service was momentarily lost, update imminent.
 *  @constant CBPeripheralManagerStateUnsupported   The platform doesn't support the Bluetooth Low Energy Peripheral/Server role.
 *  @constant CBPeripheralManagerStateUnauthorized  The application is not authorized to use the Bluetooth Low Energy Peripheral/Server role.
 *  @constant CBPeripheralManagerStatePoweredOff    Bluetooth is currently powered off.
 *  @constant CBPeripheralManagerStatePoweredOn     Bluetooth is currently powered on and available to use.
 *
 */
typedef NS_ENUM(Int, CBPeripheralManagerState) {
	CBPeripheralManagerStateUnknown = 0,
	CBPeripheralManagerStateResetting,
	CBPeripheralManagerStateUnsupported,
	CBPeripheralManagerStateUnauthorized,
	CBPeripheralManagerStatePoweredOff,
	CBPeripheralManagerStatePoweredOn
} NS_ENUM_AVAILABLE(NA, 6_0);

/*!
 *  @enum CBPeripheralManagerConnectionLatency
 *
 *  @discussion The latency of a peripheral-central connection controls how frequently messages can be exchanged.
 *
 *	@constant CBPeripheralManagerConnectionLatencyLow       Prioritizes rapid communication over battery life.
 *	@constant CBPeripheralManagerConnectionLatencyMedium    A balance between communication frequency and battery life.
 *	@constant CBPeripheralManagerConnectionLatencyHigh      Prioritizes extending battery life over rapid communication.
 *
 */
typedef NS_ENUM(Int, CBPeripheralManagerConnectionLatency) {
	CBPeripheralManagerConnectionLatencyLow = 0,
	CBPeripheralManagerConnectionLatencyMedium,
	CBPeripheralManagerConnectionLatencyHigh
} NS_ENUM_AVAILABLE(NA, 6_0);


@class CBCentral, CBService, CBMutableService, CBCharacteristic, CBMutableCharacteristic, CBATTRequest;
@protocol CBPeripheralManagerDelegate;

/*!
 *  @class CBPeripheralManager
 *
 *  @discussion Entry point to the peripheral role. Commands should only be issued when its state is <code>CBPeripheralManagerStatePoweredOn</code>.
 *              The use of more than one <code>CBPeripheralManager</code> at a time is not supported and may result in undefined behavior.
 *
 */
NS_CLASS_AVAILABLE(NA, 6_0)
CB_EXTERN_CLASS @interface CBPeripheralManager extends NSObject
{
@package
	id<CBPeripheralManagerDelegate>         _delegate;
	CBPeripheralManagerState                _state;
	BOOL                                    _advertising;
}

/*!
 *  @property delegate
 *
 *  @discussion The delegate object that will receive peripheral events.
 *
 */
@property(assign, nonatomic) id<CBPeripheralManagerDelegate> delegate;

/*!
 *  @property state
 *
 *  @discussion The current state of the peripheral, initially set to <code>CBPeripheralManagerStateUnknown</code>. Updates are provided by required
 *              delegate method @link peripheralManagerDidUpdateState: @/link.
 *
 */
@property(readonly) CBPeripheralManagerState state;

/*!
 *  @property advertising
 *
 *  @discussion Whether or not the peripheral is currently advertising data.
 *
 */
@property(readonly) BOOL isAdvertising;

/*!
 *  @method initWithDelegate:queue:
 *
 *  @param delegate The delegate that will receive peripheral role events.
 *  @param queue    The dispatch queue on which the events will be dispatched.
 *
 *  @discussion     The initialization call. The events of the peripheral role will be dispatched on the provided queue.
 *                  If <i>nil</i>, the main queue will be used.
 *
 */
- (id)initWithDelegate:(id<CBPeripheralManagerDelegate>)delegate queue:(dispatch_queue_t)queue;

/*!
 *  @method startAdvertising:
 *
 *  @param advertisementData    An optional dictionary containing the data to be advertised.
 *
 *  @discussion                 Starts advertising. Supported advertising data types are <code>CBAdvertisementDataLocalNameKey</code>
 *                              and <code>CBAdvertisementDataServiceUUIDsKey</code>.
 *                              When in the foreground, an application can utilize up to 28 bytes of space in the initial advertisement data for 
 *                              any combination of the supported advertising data types. If this space is used up, there are an additional 10 bytes of 
 *                              space in the scan response that can be used only for the local name. Note that these sizes do not include the 2 bytes 
 *                              of header information that are required for each new data type. Any service UUIDs that do not fit in the allotted space 
 *                              will be added to a special "overflow" area, and can only be discovered by an iOS device that is explicitly scanning
 *                              for them.
 *                              While an application is in the background, the local name will not be used and all service UUIDs will be placed in the
 *                              "overflow" area.
 *
 *  @see                        peripheralManagerDidStartAdvertising:error:
 *  @seealso                    CBAdvertisementData.h
 *
 */
- (void)startAdvertising:(NSDictionary *)advertisementData;

/*!
 *  @method stopAdvertising
 *
 *  @discussion Stops advertising.
 *
 */
- (void)stopAdvertising;

/*!
 *  @method setDesiredConnectionLatency:forCentral:
 *
 *  @param latency  The desired connection latency.
 *  @param central  A connected central.
 *
 *  @discussion     Sets the desired connection latency for an existing connection to <i>central</i>. Connection latency changes are not guaranteed, so the
 *                  resultant latency may vary. If a desired latency is not set, the latency chosen by <i>central</i> at the time of connection establishment
 *                  will be used. Typically, it is not necessary to change the latency.
 *
 *  @see            CBPeripheralManagerConnectionLatency
 *
 */
- (void)setDesiredConnectionLatency:(CBPeripheralManagerConnectionLatency)latency forCentral:(CBCentral *)central;

/*!
 *  @method addService:
 *
 *  @param service  A GATT service.
 *
 *  @discussion     Publishes a service and its associated characteristic(s) to the local database. If the service contains included services,
 *                  they must be published first.
 *
 *  @see            peripheralManager:didAddService:error:
 */
- (void)addService:(CBMutableService *)service;

/*!
 *  @method removeService:
 *
 *  @param service  A GATT service.
 *
 *  @discussion     Removes a published service from the local database. If the service is included by other service(s), they must be removed
 *                  first.
 *
 */
- (void)removeService:(CBMutableService *)service;

/*!
 *  @method removeAllServices
 *
 *  @discussion Removes all published services from the local database.
 *
 */
- (void)removeAllServices;

/*!
 *  @method respondToRequest:withResult:
 *
 *  @param request  The original request that was received from the central.
 *  @param result   The result of attempting to fulfill <i>request</i>.
 *
 *  @discussion     Used to respond to request(s) received via the @link peripheralManager:didReceiveReadRequest: @/link or
 *                  @link peripheralManager:didReceiveWriteRequests: @/link delegate methods.
 *
 *  @see            peripheralManager:didReceiveReadRequest:
 *  @see            peripheralManager:didReceiveWriteRequests:
 */
- (void)respondToRequest:(CBATTRequest *)request withResult:(CBATTError)result;

/*!
 *  @method updateValue:forCharacteristic:onSubscribedCentrals:
 *
 *  @param value            The value to be sent via a notification/indication.
 *  @param characteristic   The characteristic whose value has changed.
 *  @param centrals         A list of <code>CBCentral</code> objects to receive the update. Note that centrals which have not subscribed to
 *                          <i>characteristic</i> will be ignored. If <i>nil</i>, all centrals that are subscribed to <i>characteristic</i> will be updated.
 *
 *  @discussion             Sends an updated characteristic value to one or more centrals, via a notification or indication.
 *
 *  @return                 <i>YES</i> if the update could be sent, or <i>NO</i> if the underlying transmit queue is full. If <i>NO</i> was returned,
 *                          the delegate method @link peripheralManagerIsReadyToUpdateSubscribers: @/link will be called once space has become
 *                          available, and the update should be re-sent if so desired.
 *
 *  @see                    peripheralManager:central:didSubscribeToCharacteristic:
 *  @see                    peripheralManager:central:didUnsubscribeFromCharacteristic:
 *  @see                    peripheralManagerIsReadyToUpdateSubscribers:
 */
- (BOOL)updateValue:(NSData *)value forCharacteristic:(CBMutableCharacteristic *)characteristic onSubscribedCentrals:(NSArray *)centrals;

@end


/*!
 *  @protocol CBPeripheralManagerDelegate
 *
 *  @discussion The delegate of a @link CBPeripheralManager @/link object must adopt the <code>CBPeripheralManagerDelegate</code> protocol. The
 *              single required method indicates the availability of the peripheral manager, while the optional methods provide information about
 *              centrals, which can connect and access the local database.
 *
 */
@protocol CBPeripheralManagerDelegate <NSObject>

@required

/*!
 *  @method peripheralManagerDidUpdateState:
 *
 *  @param peripheral   The peripheral manager whose state has changed.
 *
 *  @discussion         Invoked whenever the peripheral manager's state has been updated. Commands should only be issued when the state is 
 *                      <code>CBPeripheralManagerStatePoweredOn</code>. A state below <code>CBPeripheralManagerStatePoweredOn</code>
 *                      implies that advertisement has stopped and any connected centrals have been disconnected. If the state moves below
 *                      <code>CBPeripheralManagerStatePoweredOff</code>, advertisement is stopped and must be explicitly restarted, and the
 *                      local database is cleared and all services must be re-added.
 *
 *  @see                state
 *
 */
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral;

@optional

/*!
 *  @method peripheralManagerDidStartAdvertising:error:
 *
 *  @param peripheral   The peripheral manager providing this information.
 *  @param error        If an error occurred, the cause of the failure.
 *
 *  @discussion         This method returns the result of a @link startAdvertising: @/link call. If advertisement could
 *                      not be started, the cause will be detailed in the <i>error</i> parameter.
 *
 */
- (void)peripheralManagerDidStartAdvertising:(CBPeripheralManager *)peripheral error:(NSError *)error;

/*!
 *  @method peripheralManager:didAddService:error:
 *
 *  @param peripheral   The peripheral manager providing this information.
 *  @param service      The service that was added to the local database.
 *  @param error        If an error occurred, the cause of the failure.
 *
 *  @discussion         This method returns the result of an @link addService: @/link call. If the service could
 *                      not be published to the local database, the cause will be detailed in the <i>error</i> parameter.
 *
 */
- (void)peripheralManager:(CBPeripheralManager *)peripheral didAddService:(CBService *)service error:(NSError *)error;

/*!
 *  @method peripheralManager:central:didSubscribeToCharacteristic:
 *
 *  @param peripheral       The peripheral manager providing this update.
 *  @param central          The central that issued the command.
 *  @param characteristic   The characteristic on which notifications or indications were enabled.
 *
 *  @discussion             This method is invoked when a central configures <i>characteristic</i> to notify or indicate.
 *                          It should be used as a cue to start sending updates as the characteristic value changes.
 *
 */
- (void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central didSubscribeToCharacteristic:(CBCharacteristic *)characteristic;

/*!
 *  @method peripheralManager:central:didUnsubscribeFromCharacteristic:
 *
 *  @param peripheral       The peripheral manager providing this update.
 *  @param central          The central that issued the command.
 *  @param characteristic   The characteristic on which notifications or indications were disabled.
 *
 *  @discussion             This method is invoked when a central removes notifications/indications from <i>characteristic</i>.
 *
 */
- (void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central didUnsubscribeFromCharacteristic:(CBCharacteristic *)characteristic;

/*!
 *  @method peripheralManager:didReceiveReadRequest:
 *
 *  @param peripheral   The peripheral manager requesting this information.
 *  @param request      A <code>CBATTRequest</code> object.
 *
 *  @discussion         This method is invoked when <i>peripheral</i> receives an ATT request for a characteristic with a dynamic value.
 *                      For every invocation of this method, @link respondToRequest:withResult: @/link must be called.
 *
 *  @see                CBATTRequest
 *
 */
- (void)peripheralManager:(CBPeripheralManager *)peripheral didReceiveReadRequest:(CBATTRequest *)request;

/*!
 *  @method peripheralManager:didReceiveWriteRequests:
 *
 *  @param peripheral   The peripheral manager requesting this information.
 *  @param requests     A list of one or more <code>CBATTRequest</code> objects.
 *
 *  @discussion         This method is invoked when <i>peripheral</i> receives an ATT request or command for one or more characteristics with a dynamic value.
 *                      For every invocation of this method, @link respondToRequest:withResult: @/link should be called exactly once. If <i>requests</i> contains
 *                      multiple requests, they must be treated as an atomic unit. If the execution of one of the requests would cause a failure, the request
 *                      and error reason should be provided to <code>respondToRequest:withResult:</code> and none of the requests should be executed.
 *
 *  @see                CBATTRequest
 *
 */
- (void)peripheralManager:(CBPeripheralManager *)peripheral didReceiveWriteRequests:(NSArray *)requests;

/*!
 *  @method peripheralManagerIsReadyToUpdateSubscribers:
 *
 *  @param peripheral   The peripheral manager providing this update.
 *
 *  @discussion         This method is invoked after a failed call to @link updateValue:forCharacteristic:onSubscribedCentrals: @/link, when <i>peripheral</i> is again
 *                      ready to send characteristic value updates.
 *
 */
- (void)peripheralManagerIsReadyToUpdateSubscribers:(CBPeripheralManager *)peripheral;

@end